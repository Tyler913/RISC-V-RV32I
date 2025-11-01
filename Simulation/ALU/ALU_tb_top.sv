`include "ALU_transaction.sv"
`include "ALU_driver.sv"
`include "ALU_monitor.sv"
`include "ALU_generator.sv"
`include "ALU_scoreboard.sv"


module ALU_tb_top ();
    ALU_interface ALU_interface_instance();

    ALU dut (
        .operand_a (ALU_interface_instance.operand_a),
        .operand_b (ALU_interface_instance.operand_b),
        .alu_control (ALU_interface_instance.alu_control),

        .alu_result (ALU_interface_instance.alu_result),
        .alu_zero_flag (ALU_interface_instance.alu_zero_flag)
    );

    mailbox #(ALU_Transaction) gen2drv_mbx = new();
    mailbox #(ALU_Transaction) mon2scb_mbx = new();

    program test (ALI_interface.TB vif);
        ALU_Generator gen;
        ALU_Driver drv;
        ALU_Monitor mon;
        ALU_Scoreboard scb;

        initial begin
            gen = new(gen2drv_mbx);
            drv = new(vif, gen2drv_mbx);
            mon = new(vif, mon2scb_mbx);
            scb = new(mon2scb_mbx);

            fork
                gen.run();
                drv.run();
                mon.run();
                scb.run();
            join_none

            wait (scb.num_transmitted == gen.num_transactions);
            #20

            $display("-------------------------------------------------");
            $display("TEST COMPLETED: PASSED=%0d, FAILED=%0d",
                scb.pass_count, scb.fail_count);
            $display("-------------------------------------------------");

            $stop;
        end
    endprogram

    test test_instance (ALU_interface_instance.TB);

endmodule
