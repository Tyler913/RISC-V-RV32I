
// file: PLL_1.v
// (c) Copyright 2017-2018, 2023 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// pll_1_100MHz__100.00000______0.000______50.0______144.719____114.212
// pll_1_200MHz__200.00000______0.000______50.0______126.455____114.212
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________100.000____________0.010

`timescale 1ps/1ps

module PLL_1_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output        pll_1_100MHz,
  output        pll_1_200MHz,
  // Status and control signals
  input         resetn,
  output        pll_1_locked,
  input         system_clock_100MHz
 );
  // Input buffering
  //------------------------------------
wire system_clock_100MHz_PLL_1;
wire clk_in2_PLL_1;
  IBUF clkin1_ibuf
   (.O (system_clock_100MHz_PLL_1),
    .I (system_clock_100MHz));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        pll_1_100MHz_PLL_1;
  wire        pll_1_200MHz_PLL_1;
  wire        clk_out3_PLL_1;
  wire        clk_out4_PLL_1;
  wire        clk_out5_PLL_1;
  wire        clk_out6_PLL_1;
  wire        clk_out7_PLL_1;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        pll_1_locked_int;
  wire        clkfbout_PLL_1;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1b_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;

 

// Auto Instantiation//

  
    PLLE4_ADV
  #(
    .COMPENSATION         ("AUTO"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT        (8),
    .CLKFBOUT_PHASE       (0.000),
    .CLKOUT0_DIVIDE       (8),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT1_DIVIDE       (4),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKIN_PERIOD         (10.000))
  
  plle4_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_PLL_1),
    .CLKOUT0             (pll_1_100MHz_PLL_1),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (pll_1_200MHz_PLL_1),
    .CLKOUT1B            (clkout1b_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_PLL_1),
    .CLKIN               (system_clock_100MHz_PLL_1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    .CLKOUTPHYEN         (1'b0),
    .CLKOUTPHY           (),
    // Other control and status signals
    .LOCKED              (pll_1_locked_int),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));


  assign reset_high = ~resetn; 

  assign pll_1_locked = pll_1_locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------






  BUFG clkout1_buf
   (.O   (pll_1_100MHz),
    .I   (pll_1_100MHz_PLL_1));


  BUFG clkout2_buf
   (.O   (pll_1_200MHz),
    .I   (pll_1_200MHz_PLL_1));



endmodule
