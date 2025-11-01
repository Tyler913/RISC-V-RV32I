`ifndef ALU_TRANSACTION_SV
`define ALU_TRANSACTION_SV


class ALU_Transaction;
    rand bit [31:0] operand_a;
    rand bit [31:0] operand_b;
    rand bit [3:0] alu_control;

    bit [31:0] alu_result;
    bit alu_zero_flag;


    constraint c_valid_control {
        alu_control inside {[0:9]};
    }


    function void diaplay(string name = "ALU_Transaction");
        $$display("[%s] a=0x%h, b=0x%h, ctrl=%d -> result=0x%h, zero=%b",
            name, operand_a, operand_b, alu_control, alu_result, alu_zero_flag);
    endfunction

endclass //ALU_Transaction

`endif
