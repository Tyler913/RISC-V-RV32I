module ALU (
    input  wire [31:0] operand_a,
    input  wire [31:0] operand_b,
    input  wire [3:0]  alu_control,
    output reg  [31:0] alu_result,
    output reg         alu_zero_flag
);

    // ALU operation codes
    localparam ALU_ADD  = 4'd0;
    localparam ALU_SUB  = 4'd1;
    localparam ALU_SLL  = 4'd2; // Shift Left Logical
    localparam ALU_SRL  = 4'd3; // Shift Right Logical
    localparam ALU_SRA  = 4'd4; // Shift Right Arithmetic
    localparam ALU_SLT  = 4'd5; // Set Less Than Signed
    localparam ALU_SLTU = 4'd6; // Set Less Than Unsigned
    localparam ALU_AND  = 4'd7;
    localparam ALU_OR   = 4'd8;
    localparam ALU_XOR  = 4'd9;

    always @(*) begin
        case (alu_control)
            ALU_ADD:  alu_result = operand_a + operand_b;
            ALU_SUB:  alu_result = operand_a - operand_b;
            ALU_SLL:  alu_result = operand_a << operand_b[4:0];
            ALU_SRL:  alu_result = operand_a >> operand_b[4:0];
            ALU_SRA:  alu_result = $signed(operand_a) >>> operand_b[4:0];
            ALU_SLT:  alu_result = ($signed(operand_a) < $signed(operand_b)) ? 32'b1 : 32'b0;
            ALU_SLTU: alu_result = (operand_a < operand_b) ? 32'b1 : 32'b0;
            ALU_AND:  alu_result = operand_a & operand_b;
            ALU_OR:   alu_result = operand_a | operand_b;
            ALU_XOR:  alu_result = operand_a ^ operand_b;
            default:  alu_result = 32'b0;
        endcase

        alu_zero_flag = (alu_result == 32'd0) ? 1'b1 : 1'b0;
    end

endmodule
