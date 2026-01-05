# RISC-V RV32I Processor

A synthesizable implementation of the RISC-V RV32I Base Integer Instruction Set Architecture using Verilog. This project features a single-cycle datapath design and is targeted for Xilinx FPGAs using Vivado.

## Project Overview

This repository contains the RTL source code, simulation testbenches, and Vivado project files for a 32-bit RISC-V processor. The core implements the standard RV32I instruction set, making it capable of integer arithmetic, logic operations, load/store memory access, and control flow instructions.

### Key Features

*   **ISA Compliance**: RISC-V RV32I Base Integer Instruction Set.
*   **Architecture**: Single-Cycle Datapath.
*   **Memory Model**: Modified Harvard Architecture (Separate Instruction and Data Memory modules).
*   **Clocking**: Integrated Xilinx Clock Wizard (PLL) converting 100MHz system clock to 200MHz core clock.
*   **Simulation**: SystemVerilog testbench environment.

## Directory Structure

```text
├── IP/                 # Xilinx IP cores (PLL configurations)
├── RTL/                # Synthesizable Verilog source code
│   ├── ALU.v           # Arithmetic Logic Unit
│   ├── Control_Unit.v  # Main and ALU Control logic
│   ├── Register_File.v # 32x32-bit Register File
│   └── ...             # Other datapath components
├── Simulation/         # Simulation files and Testbenches
│   ├── ALU/            # SystemVerilog testbench components for ALU
│   └── ...
└── Vivado_Project/     # Xilinx Vivado project files (.xpr)
```

## Supported Instructions (RV32I)

The processor supports the following instruction categories:

*   **Arithmetic/Logic (R-Type)**: `add`, `sub`, `and`, `or`, `xor`, `sll`, `srl`, `sra`, `slt`, `sltu`
*   **Immediate Arithmetic (I-Type)**: `addi`, `andi`, `ori`, `xori`, `slli`, `srli`, `srai`, `slti`, `sltiu`
*   **Load/Store**: `lb`, `lh`, `lw`, `lbu`, `lhu`, `sb`, `sh`, `sw`
*   **Branching (B-Type)**: `beq`, `bne`, `blt`, `bge`, `bltu`, `bgeu`
*   **Jumps**: `jal` (J-Type), `jalr` (I-Type)
*   **Upper Immediate**: `lui`, `auipc`

## Getting Started

### Prerequisites

*   **Xilinx Vivado** (Project created in version compatible with the IP/scripts provided).
*   **ModelSim/QuestaSim** (Optional, for running specific SV testbenches if not using Vivado Simulator).

### Running the Project

1.  **Open Vivado**:
    *   Launch Xilinx Vivado.
    *   Open the project file located at `Vivado_Project/RISC-V-RV32I.xpr`.

2.  **Simulation**:
    *   The `Instruction_Memory.v` module expects a hexadecimal file named `program.hex` to initialize the instruction memory.
    *   Ensure `program.hex` is present in the simulation directory or properly referenced in the simulation settings.
    *   Run Behavioral Simulation in Vivado to observe the processor execution.

3.  **Synthesis**:
    *   The top-level module is `RISC_V_RV32I_top`.
    *   Run Synthesis to generate the netlist and check resource utilization.

## Module Descriptions

*   **RISC_V_RV32I_top**: The top-level wrapper instantiating the Datapath, Control Units, Memories, and PLL.
*   **Main_Control_Unit**: Decodes the 7-bit Opcode to generate control signals for the datapath.
*   **ALU_Control_Unit**: Decodes `funct3` and `funct7` fields to determine the specific ALU operation.
*   **Immediate_Generator**: Handles sign-extension for various instruction formats (I, S, B, U, J).
*   **Data_Memory / Instruction_Memory**: Synchronous memory modules.
