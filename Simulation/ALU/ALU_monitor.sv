`include "ALU_interface.sv"
`include "ALU_transaction.sv"


class ALU_Monitor;
    virtual ALU_interface.TB vif;

    mailbox #(ALU_Transaction) mon2scb_mbx;

    function new(virtual ALU_interface.TB vif, mailbox #(ALU_Transaction) mon2scb_mbx);
        this.vif = vif;
        this.mon2scb_mbx = mon2scb_mbx;
    endfunction

    task run();
        $display("Monitor: run() task started.");

        forever begin
            ALU_Transaction txn = new();

            #1;

            txn.operand_a = vif.operand_a;
            txn.operand_b = vif.operand_b;
            txn.alu_control = vif.alu_control;

            txn.alu_result = vif.alu_result;
            txn.alu_zero_flag = vif.alu_zero_flag;

            mon2scb_mbx.put(txn);
        end
    endtask
endclass
