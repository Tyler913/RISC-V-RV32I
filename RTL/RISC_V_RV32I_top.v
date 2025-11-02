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


reg [6:0] opcode;
wire reg_write;
wire alu_src;
wire mem_read;
wire mem_write;
wire branch;
wire jump;
wire mem_to_reg;
wire [1:0] writeback_sel;
wire [1:0] alu_op;

Main_Control_Unit Main_Control_Unit_Instance (
    .opcode(opcode),

    .reg_write(reg_write),
    .alu_src(alu_src),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .branch(branch),
    .jump(jump),
    .mem_to_reg(mem_to_reg),
    .writeback_sel(writeback_sel),
    .alu_op(alu_op)
);


wire [2:0] funct3;
wire [6:0] funct7;
wire [3:0] alu_control;

ALU_Control_Unit ALU_Control_Unit_Instance (
    .alu_op(alu_op),
    .funct3(funct3),
    .funct7(funct7),

    .alu_control(alu_control)
);


reg [4:0] read_reg1;
reg [4:0] read_reg2;
reg [4:0] write_reg;
reg [31:0] write_data;
reg [31:0] read_data1;
reg [31:0] read_data2;

Register_File Register_File_Instance (
    .pll_1_200MHz(pll_1_200MHz),

    .write_enable(reg_write),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(write_data),

    .read_data1(read_data1),
    .read_data2(read_data2)
);


reg [31:0] operand_a;
reg [31:0] operand_b;
wire [31:0] alu_result;
wire alu_zero_flag;

ALU ALU_Instance(
    .operand_a(operand_a),
    .operand_b(operand_b),
    .alu_control(alu_control),

    .alu_result(alu_result),
    .alu_zero_flag(alu_zero_flag)
);

endmodule
