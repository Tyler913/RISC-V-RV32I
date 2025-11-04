module Program_Counter (
    input wire pll_1_200MHz,
    input wire pll_1_locked_synced,
    input wire [31:0] last_pc_address,

    output reg [31:0] next_pc_address
);

endmodule
