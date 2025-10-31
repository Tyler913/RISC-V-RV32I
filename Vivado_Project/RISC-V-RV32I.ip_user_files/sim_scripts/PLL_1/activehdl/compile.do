transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic" "+incdir+../../../../../../../../../../Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"D:/Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"D:/Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" "+incdir+../../../../../../../../../../Applications/Vivado_2025.1.1/2025.1.1/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"../../../../../IP/PLL_1/PLL_1_clk_wiz.v" \
"../../../../../IP/PLL_1/PLL_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

