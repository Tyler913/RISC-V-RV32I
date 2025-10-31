-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
-- Date        : Sat Nov  1 01:26:44 2025
-- Host        : Tyler running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/TylerHong/Development/GitHub_Project/FPGA/RISC-V-RV32I/IP/PLL_1/PLL_1_stub.vhdl
-- Design      : PLL_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sfvc784-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PLL_1 is
  Port ( 
    pll_1_100MHz : out STD_LOGIC;
    pll_1_200MHz : out STD_LOGIC;
    resetn : in STD_LOGIC;
    pll_1_locked : out STD_LOGIC;
    system_clock_100MHz : in STD_LOGIC
  );

  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of PLL_1 : entity is "PLL_1,clk_wiz_v6_0_16_0_0,{component_name=PLL_1,use_phase_alignment=false,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=PLL,num_out_clk=2,clkin1_period=10.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
end PLL_1;

architecture stub of PLL_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "pll_1_100MHz,pll_1_200MHz,resetn,pll_1_locked,system_clock_100MHz";
begin
end;
