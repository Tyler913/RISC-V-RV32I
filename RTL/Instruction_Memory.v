module Instruction_Memory (
    input wire [31:0] program_counter,

    output wire [31:0] instruction
);

    reg [31:0] instruction_memory [0:1023];

    initial begin
        $readmemh("program.hex", instruction_memory);
    end

    assign instruction = instruction_memory[program_counter[11:2]];

endmodule
