module RISC_V_RV32I_top (
    input wire system_clock_100MHz,
    input wire system_reset_n
);


wire pll_1_100MHz;
wire pll_1_200MHz;
wire pll_1_locked;
reg pll_1_locked_synced;


PLL_1 PLL_1_Instance (
    .system_clock_100MHz(system_clock_100MHz),
    .resetn(system_reset_n),
    .pll_1_100MHz(pll_1_100MHz),
    .pll_1_200MHz(pll_1_200MHz),
    .pll_1_locked(pll_1_locked)
);


always @(posedge pll_1_200MHz or negedge pll_1_locked) begin
    if (pll_1_locked == 1'b0) begin
        pll_1_locked_synced <= 1'b0;
    end
    else begin
        pll_1_locked_synced <= 1'b1;
    end
end

endmodule
