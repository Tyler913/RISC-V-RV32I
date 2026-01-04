module RISC_V_RV32I_top (
    input wire system_clock_100MHz,
    input wire system_reset_n
);

    wire pll_1_100MHz;
    wire pll_1_200MHz;
    wire pll_1_locked;
    reg pll_1_locked_synced;

    PLL_1 PLL_1_Instance (
        .system_clock_100MHz(system_clock_100MHz),
        .resetn(system_reset_n),
        .pll_1_100MHz(pll_1_100MHz),
        .pll_1_200MHz(pll_1_200MHz),
        .pll_1_locked(pll_1_locked)
    );

    always @(posedge pll_1_200MHz or negedge pll_1_locked) begin
        if (pll_1_locked == 1'b0) begin
            pll_1_locked_synced <= 1'b0;
        end
        else begin
            pll_1_locked_synced <= 1'b1;
        end
    end

    wire [31:0] instruction;

    // Output from Main_Control_Unit
    wire reg_write;
    wire alu_src;
    wire mem_read;
    wire mem_write;
    wire branch;
    wire jump;
    wire [1:0] writeback_sel;
    wire [1:0] alu_op;

    // Output from ALU_Control_Unit
    wire [3:0] alu_control;

    // Input for Register_File
    wire [31:0] write_data;

    // Data memory read output (used for loads)
    wire [31:0] mem_read_data;

    // Output from Register_File
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Input to ALU
    wire [31:0] immediate_value;
    wire [31:0] operand_a;
    wire [31:0] operand_b;

    // Output from ALU
    wire [31:0] alu_result;
    wire alu_zero_flag;

    // Input to Program_Counter
    wire [31:0] next_pc_address;

    // Output from Program_Counter
    wire [31:0] current_pc_address;

    wire [31:0] pc_plus_4;

    Program_Counter Program_Counter_Instance (
        .pll_1_200MHz(pll_1_200MHz),
        .pll_1_locked_synced(pll_1_locked_synced),
        .next_pc_address(next_pc_address),

        .current_pc_address(current_pc_address)
    );

    assign pc_plus_4 = current_pc_address + 32'd4;

    // Instruction fields used for top-level datapath decisions
    wire [6:0] opcode;
    wire [2:0] funct3;
    assign opcode = instruction[6:0];
    assign funct3 = instruction[14:12];

    // Jumps
    wire is_jal;
    wire is_jalr;
    assign is_jal  = (opcode == 7'b1101111);
    assign is_jalr = (opcode == 7'b1100111);

    // AUIPC uses PC as ALU operand A (rd = PC + imm)
    wire is_auipc;
    assign is_auipc = (opcode == 7'b0010111);

    // Branch decision (taken/not taken)
    wire rs_equal;
    wire rs_lt_signed;
    wire rs_lt_unsigned;
    assign rs_equal       = (read_data1 == read_data2);
    assign rs_lt_signed   = ($signed(read_data1) < $signed(read_data2));
    assign rs_lt_unsigned = (read_data1 < read_data2);

    wire branch_taken;
    assign branch_taken = branch && (
        ((funct3 == 3'b000) && rs_equal)            || // beq
        ((funct3 == 3'b001) && ~rs_equal)           || // bne
        ((funct3 == 3'b100) && rs_lt_signed)        || // blt
        ((funct3 == 3'b101) && ~rs_lt_signed)       || // bge
        ((funct3 == 3'b110) && rs_lt_unsigned)      || // bltu
        ((funct3 == 3'b111) && ~rs_lt_unsigned)        // bgeu
    );

    // Next PC selection
    wire [31:0] branch_target;
    wire [31:0] jal_target;
    wire [31:0] jalr_target;
    assign branch_target = current_pc_address + immediate_value;
    assign jal_target    = current_pc_address + immediate_value;
    assign jalr_target   = (read_data1 + immediate_value) & 32'hFFFF_FFFE;

    assign next_pc_address =    is_jalr        ? jalr_target  :
                                is_jal         ? jal_target   :
                                branch_taken   ? branch_target:
                                pc_plus_4;

    Instruction_Memory Instruction_Memory_Instance (
        .program_counter(current_pc_address),

        .instruction(instruction)
    );

    Main_Control_Unit Main_Control_Unit_Instance (
        .opcode(instruction[6:0]),

        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .jump(jump),
        .writeback_sel(writeback_sel),
        .alu_op(alu_op)
    );

    Immediate_Generator Immediate_Generator_Instance (
        .instruction(instruction),

        .immediate_value(immediate_value)
    );

    ALU_Control_Unit ALU_Control_Unit_Instance (
        .alu_op(alu_op),
        .funct3(instruction[14:12]),
        .funct7(instruction[31:25]),

        .alu_control(alu_control)
    );

    Register_File Register_File_Instance (
        .pll_1_200MHz(pll_1_200MHz),
        .write_enable(reg_write),
        .read_reg1(instruction[19:15]),
        .read_reg2(instruction[24:20]),
        .write_reg(instruction[11:7]),
        .write_data(write_data),

        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Writeback mux (what value is written to rd)
    assign write_data = (writeback_sel == 2'b00) ? alu_result     :
                        (writeback_sel == 2'b01) ? mem_read_data  :
                        (writeback_sel == 2'b10) ? pc_plus_4      :
                        (writeback_sel == 2'b11) ? immediate_value:
                        alu_result;

    // ALU operands
    assign operand_a = is_auipc ? current_pc_address : read_data1;

    assign operand_b = (alu_src == 1'b1) ? immediate_value : read_data2;

    ALU ALU_Instance(
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_control(alu_control),

        .alu_result(alu_result),
        .alu_zero_flag(alu_zero_flag)
    );

    Data_Memory Data_Memory_Instance (
        .pll_1_200MHz(pll_1_200MHz),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .address(alu_result),
        .write_data(read_data2),

        .read_data(mem_read_data)
    );

endmodule
