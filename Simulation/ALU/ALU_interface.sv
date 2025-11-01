`ifndef ALU_INTERFACE_SV
`define ALU_INTERFACE_SV


interface ALU_interface;
    logic [31:0] operand_a;
    logic [31:0] operand_b;
    logic [3:0] alu_control;

    logic [31:0] alu_result;
    logic alu_zero_flag;


    modport TB (
    input operand_a,
    input operand_b,
    input alu_control,

    output alu_result,
    output alu_zero_flag
    );


    modport DUT (
        input operand_a,
        input operand_b,
        input alu_control,

        output alu_result,
        output alu_zero_flag
    );

endinterface //ALU_interface

`endif
