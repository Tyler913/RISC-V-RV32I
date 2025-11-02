`timescale 1ns/1ps


module ALU_tb;
    reg [31:0] operand_a;
    reg [31:0] operand_b;
    reg [3:0] alu_control;

    wire [31:0] alu_result;
    wire alu_zero_flag;

    integer error_count = 0;


    ALU ALU_instance (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_control(alu_control),

        .alu_result(alu_result),
        .alu_zero_flag(alu_zero_flag)
    );

    // localparam ALU_ADD = 4'd0;
    // localparam ALU_SUB = 4'd1;
    // localparam ALU_SLL = 4'd2; // Shift Left Logical
    // localparam ALU_SRL = 4'd3; // Shift Right Logical
    // localparam ALU_SRA = 4'd4; // Shift Right Arithmetic
    // localparam ALU_SLT = 4'd5; // Set Less Than Signed
    // localparam ALU_SLTU = 4'd6; // Set Less Than Unsigned
    // localparam ALU_AND = 4'd7;
    // localparam ALU_OR  = 4'd8;
    // localparam ALU_XOR = 4'd9;


    initial begin
        $dumpfile("ALU_tb.vcd");
        $dumpvars(0, ALU_tb);

        $display("Starting ALU Testbench...");

        $display("Testing 1: ADD");
        operand_a = 32'd10;
        operand_b = 32'd5;
        alu_control = 4'd0;
        #10;
        if (alu_result !== 32'd0 || alu_zero_flag !== 1'b0) begin
            $display("Test 1 Failed: ADD");
            error_count = error_count + 1;
        end
    end
endmodule
