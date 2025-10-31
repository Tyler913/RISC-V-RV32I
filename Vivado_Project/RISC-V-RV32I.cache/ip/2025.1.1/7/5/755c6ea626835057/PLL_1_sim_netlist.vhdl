-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
-- Date        : Sat Nov  1 01:26:43 2025
-- Host        : Tyler running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ PLL_1_sim_netlist.vhdl
-- Design      : PLL_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfvc784-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PLL_1_clk_wiz is
  port (
    pll_1_100MHz : out STD_LOGIC;
    pll_1_200MHz : out STD_LOGIC;
    resetn : in STD_LOGIC;
    pll_1_locked : out STD_LOGIC;
    system_clock_100MHz : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PLL_1_clk_wiz;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PLL_1_clk_wiz is
  signal pll_1_100MHz_PLL_1 : STD_LOGIC;
  signal pll_1_200MHz_PLL_1 : STD_LOGIC;
  signal reset_high : STD_LOGIC;
  signal system_clock_100MHz_PLL_1 : STD_LOGIC;
  signal NLW_plle4_adv_inst_CLKFBIN_UNCONNECTED : STD_LOGIC;
  signal NLW_plle4_adv_inst_CLKFBOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_plle4_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_plle4_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_plle4_adv_inst_CLKOUTPHY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle4_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle4_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkin1_ibuf : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibuf : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibuf : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibuf : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of clkout1_buf : label is "BUFG";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of clkout1_buf : label is "VCC:CE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of clkout2_buf : label is "BUFG";
  attribute XILINX_TRANSFORM_PINMAP of clkout2_buf : label is "VCC:CE";
  attribute BOX_TYPE of plle4_adv_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of plle4_adv_inst : label is "MLO";
begin
clkin1_ibuf: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => system_clock_100MHz,
      O => system_clock_100MHz_PLL_1
    );
clkout1_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => pll_1_100MHz_PLL_1,
      O => pll_1_100MHz
    );
clkout2_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => pll_1_200MHz_PLL_1,
      O => pll_1_200MHz
    );
plle4_adv_inst: unisim.vcomponents.PLLE4_ADV
    generic map(
      CLKFBOUT_MULT => 8,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 10.000000,
      CLKOUT0_DIVIDE => 8,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 4,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUTPHY_MODE => "VCO_2X",
      COMPENSATION => "INTERNAL",
      DIVCLK_DIVIDE => 1,
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => NLW_plle4_adv_inst_CLKFBIN_UNCONNECTED,
      CLKFBOUT => NLW_plle4_adv_inst_CLKFBOUT_UNCONNECTED,
      CLKIN => system_clock_100MHz_PLL_1,
      CLKOUT0 => pll_1_100MHz_PLL_1,
      CLKOUT0B => NLW_plle4_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => pll_1_200MHz_PLL_1,
      CLKOUT1B => NLW_plle4_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUTPHY => NLW_plle4_adv_inst_CLKOUTPHY_UNCONNECTED,
      CLKOUTPHYEN => '0',
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle4_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle4_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => pll_1_locked,
      PWRDWN => '0',
      RST => reset_high
    );
plle4_adv_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => reset_high
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    pll_1_100MHz : out STD_LOGIC;
    pll_1_200MHz : out STD_LOGIC;
    resetn : in STD_LOGIC;
    pll_1_locked : out STD_LOGIC;
    system_clock_100MHz : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PLL_1_clk_wiz
     port map (
      pll_1_100MHz => pll_1_100MHz,
      pll_1_200MHz => pll_1_200MHz,
      pll_1_locked => pll_1_locked,
      resetn => resetn,
      system_clock_100MHz => system_clock_100MHz
    );
end STRUCTURE;
