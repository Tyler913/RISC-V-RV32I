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

// Output from Register_File
wire [31:0] read_data1;
wire [31:0] read_data2;

// Input to ALU
wire [31:0] immediate_value;
wire [31:0] operand_b;

//Output from ALU
wire [31:0] alu_result;
wire alu_zero_flag;


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


assign operand_b = (alu_src == 1'b1) ? immediate_value : read_data2;

ALU ALU_Instance(
    .operand_a(read_data1),
    .operand_b(operand_b),
    .alu_control(alu_control),

    .alu_result(alu_result),
    .alu_zero_flag(alu_zero_flag)
);

endmodule
