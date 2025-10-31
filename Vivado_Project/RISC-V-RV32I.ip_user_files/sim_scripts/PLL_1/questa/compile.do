vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../ipstatic" "+incdir+../../../../../../../../../../Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/rsb/busdef" \
"../../../../../IP/PLL_1/PLL_1_clk_wiz.v" \
"../../../../../IP/PLL_1/PLL_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

