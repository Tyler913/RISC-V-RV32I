vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../ipstatic" "+incdir+../../../../../../../../../../Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/rsb/busdef" \
"D:/Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"D:/Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../ipstatic" "+incdir+../../../../../../../../../../Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/rsb/busdef" \
"../../../../../IP/PLL_1/PLL_1_clk_wiz.v" \
"../../../../../IP/PLL_1/PLL_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

