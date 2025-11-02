module Main_Control_Unit (
    input wire [6:0] opcode,

    output reg reg_write,
    output reg alu_src,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg jump,
    output reg mem_to_reg,
    // 2'b00 = Write data from ALU result
    // 2'b01 = Write data from Data Memory
    // 2'b10 = Write data from PC+4 (for jal/jalr)
    // 2'b11 = Write data from immediate (for lui)
    output reg [1:0] writeback_sel,
    // 2'b00 = Force ALU to ADD (for loads, stores, auipc, jalr)
    // 2'b01 = Branch (tell ALU_Control to check funct3 for beq/bne/etc)
    // 2'b10 = R-type (tell ALU_Control to check funct3/funct7)
    // 2'b11 = I-type ALU (tell ALU_Control to check funct3 for addi/xori/etc)
    output reg [1:0] alu_op
);


always @(*) begin
    case (opcode)
        7'b0110011: begin
            reg_write     = 1'b1;
            writeback_sel = 2'b00;
            alu_op        = 2'b10;
        end

        7'b0010011: begin
            reg_write     = 1'b1;
            alu_src       = 1'b1;
            writeback_sel = 2'b00;
            alu_op        = 2'b11;
        end

        7'b0000011: begin
            reg_write     = 1'b1;
            alu_src       = 1'b1;
            mem_read      = 1'b1;
            writeback_sel = 2'b01;
            alu_op        = 2'b00;
        end

        7'b0100011: begin
            alu_src   = 1'b1;
            mem_write = 1'b1;
            alu_op    = 2'b00;
        end

        7'b1100011: begin
            branch = 1'b1;
            alu_op = 2'b01;
        end

        7'b0110111: begin
            reg_write     = 1'b1;
            alu_src       = 1'b1;
            writeback_sel = 2'b11;
            alu_op        = 2'b00;
        end

        7'b0010111: begin
            reg_write     = 1'b1;
            alu_src       = 1'b1;
            writeback_sel = 2'b00;
            alu_op        = 2'b00;
        end

        7'b1101111: begin
            reg_write     = 1'b1;
            jump          = 1'b1;
            writeback_sel = 2'b10;
        end

        7'b1100111: begin
            reg_write     = 1'b1;
            alu_src       = 1'b1;
            jump          = 1'b1;
            writeback_sel = 2'b10;
            alu_op        = 2'b00;
        end

        default: begin
            reg_write     = 1'b0;
            alu_src       = 1'b0;
            mem_read      = 1'b0;
            mem_write     = 1'b0;
            branch        = 1'b0;
            jump          = 1'b0;
            writeback_sel = 2'b00;
            alu_op        = 2'b00;
        end
    endcase
end

endmodule
