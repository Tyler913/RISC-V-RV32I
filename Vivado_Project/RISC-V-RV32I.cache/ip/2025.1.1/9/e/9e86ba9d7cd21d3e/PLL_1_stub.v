// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
// Date        : Fri Jan  2 17:41:01 2026
// Host        : Tyler running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ PLL_1_stub.v
// Design      : PLL_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu2eg-sfvc784-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CORE_GENERATION_INFO = "PLL_1,clk_wiz_v6_0_16_0_0,{component_name=PLL_1,use_phase_alignment=false,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=PLL,num_out_clk=2,clkin1_period=10.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(pll_1_100MHz, pll_1_200MHz, resetn, 
  pll_1_locked, system_clock_100MHz)
/* synthesis syn_black_box black_box_pad_pin="resetn,pll_1_locked,system_clock_100MHz" */
/* synthesis syn_force_seq_prim="pll_1_100MHz" */
/* synthesis syn_force_seq_prim="pll_1_200MHz" */;
  output pll_1_100MHz /* synthesis syn_isclock = 1 */;
  output pll_1_200MHz /* synthesis syn_isclock = 1 */;
  input resetn;
  output pll_1_locked;
  input system_clock_100MHz;
endmodule
