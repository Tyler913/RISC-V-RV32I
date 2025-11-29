module Program_Counter (
    input wire pll_1_200MHz,
    input wire pll_1_locked_synced,
    input wire [31:0] next_pc_address,

    output reg [31:0] current_pc_address
);

    always @(posedge pll_1_200MHz or negedge pll_1_locked_synced) begin
        if (pll_1_locked_synced == 1'b0) begin
            current_pc_address <= 32'd0;
        end
        else begin
            current_pc_address <= next_pc_address;
        end
    end

endmodule
