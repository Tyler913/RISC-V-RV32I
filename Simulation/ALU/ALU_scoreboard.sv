`include "ALU_transaction.sv"


class ALU_Scoreboard;
    mailbox #(ALU_Transaction) mon2scb_mbx;

    int pass_count = 0;
    int fail_count = 0;

    int num_transmitted = 0;

    function new(mailbox #(ALU_Transaction) mon2scb_mbx);
        this.mon2scb_mbx = mon2scb_mbx;
    endfunction

    task run();
        $display("Scoreboard: run() task started.");

        forever begin
            ALU_Transaction obs_txn;
            bit [31:0] expexted_result;
            bit expexted_zero;

            mon2scb_mbx.get(obs_txn);

            num_transmitted ++;

            case (obs_txn.alu_control)
                4'd0: expexted_result = obs_txn.operand_a + obs_txn.operand_b;
                4'd1: expexted_result = obs_txn.operand_a - obs_txn.operand_b;
                4'd2: expexted_result = obs_txn.operand_a << obs_txn.operand_b[4:0];
                4'd3: expexted_result = obs_txn.operand_a >> obs_txn.operand_b[4:0];
                4'd4: expexted_result = $signed(obs_txn.operand_a) >>> obs_txn.operand_b[4:0];
                4'd5: expexted_result = ($signed(obs_txn.operand_a) < $signed(obs_txn.operand_b)) ? 32'd1 : 32'd0;
                4'd6: expexted_result = (obs_txn.operand_a < obs_txn.operand_b) ? 32'd1 : 32'd0;
                4'd7: expexted_result = obs_txn.operand_a & obs_txn.operand_b;
                4'd8: expexted_result = obs_txn.operand_a | obs_txn.operand_b;
                4'd9: expexted_result = obs_txn.operand_a ^ obs_txn.operand_b;
                default: expexted_result = 32'd0;
            endcase

            expexted_zero = (expexted_result == 32'd0) ? 1'b1 : 1'b0;


            if (expexted_result == obs_txn.alu_result && expexted_zero == obs_txn.alu_zero_flag) begin
                pass_count ++;
            end
            else begin
                fail_count++;
                $error("---------Scoreboard: Mismatch-----------");
                obs_txn.display("Scoreboard: Observed");
                $display("Expected: result=0x%h, zero=%b",
                    expexted_result, expexted_zero);
            end
        end
    endtask
endclass
