`include "ALU_transaction.sv"


class ALU_Generator;
    mailbox #(ALU_Transaction) gen2driv_mbx;

    int num_transactions = 100;

    function new(mailbox #(ALU_Transaction) gen2driv_mbx);
        this.gen2driv_mbx = gen2driv_mbx;
    endfunction

    task run();
        $display("Generator: run() task started. Will generate %0d txns.",
            num_transactions);
        
        repeat (num_transactions) begin
            ALU_Transaction txn = new();

            if (! txn.randomize()) begin
                $error("Generator: Randomization failed!");
            end

            gen2driv_mbx.put(txn);
            txn.display("Generator: Sent");
        end

        $display("generator: Finished generating all txns.");
    endtask
endclass
