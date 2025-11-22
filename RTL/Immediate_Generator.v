module Immediate_Generator (
    input wire [31:0] instruction,

    output reg [31:0] immediate_value
);

wire [6:0] opcode;
assign opcode = instruction[6:0];


always @(*) begin
    case (opcode)
        // I-Type
        7'b0010011, 7'b0000011, 7'b1100111: begin
            immediate_value = {{20{instruction[31]}}, instruction[31:20]};
        end
        // S-Type
        7'b0100011: begin
            immediate_value = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
        end
        // B-Type
        7'b1100011: begin
            immediate_value = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
        end
        // J-Type
        7'b1101111: begin
            immediate_value = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
        end
        // U-Type
        7'b0110111, 7'b0010111: begin
            immediate_value = {instruction[31:12], 12'd0};
        end
        // Don't care
        7'b0110011: begin
            immediate_value = 32'd0;
        end
        default: begin
            immediate_value = 32'd0;
        end
    endcase
end

endmodule
