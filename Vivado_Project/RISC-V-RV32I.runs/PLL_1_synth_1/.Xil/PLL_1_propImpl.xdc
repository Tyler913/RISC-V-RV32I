set_property SRC_FILE_INFO {cfile:d:/TylerHong/Development/GitHub_Project/FPGA/RISC-V-RV32I/IP/PLL_1/PLL_1.xdc rfile:../../../../IP/PLL_1/PLL_1.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports system_clock_100MHz]] 0.100
