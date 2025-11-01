`include "ALU_interface.sv"
`include "ALU_transaction.sv"


class ALU_Driver;
    virtual ALI_interface.TB vif;

    mailbox #(ALU_Transaction) gen2drv_mbx;

    function new(virtual ALU_interface.TB vif, mailbox #(ALU_Transaction) gen2drv_mbx);
        this.vif = vif;
        this.gen2drv_mbx = gen2drv_mbx;
    endfunction

    task run();
        $display("Driver: run() task started.");

        forever begin
            ALU_Transaction txn;
            gen2drv_mbx.get(txn);

            vif.operand_a    <= txn.operand_a;
            vif.operand_b    <= txn.operand_b;
            vif.alu_control  <= txn.alu_control;

            #1;
        end
    endtask
endclass //ALU_Driver
