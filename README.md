# Project Name: Pipelined MIPS-Lite CPU with Verilog

## Table of Contents:

- [Description](#description)
- [Development Environment](#development-environment)
- [Features](#features)
- [Architecture](#architecture)
- [Instruction](#instruction)
  - [Integer Arithmetic](#integer-arithmetic)
  - [Integer Memory Access](#integer-memory-access)
  - [Integer Branch](#integer-branch)
  - [Integer Multiply](#integer-multiply)
  - [Other Instructions](#other-instructions)

## Description:

This project aims to implement a pipelined MIPS-Lite CPU using Verilog. The CPU will be capable of executing a subset of MIPS instructions and will include a pipeline structure to improve performance.

## Development Environment

ModelSim


## Features:

- Pipelined architecture for improved performance.
- Subset of MIPS instructions supported.
- Modular design for easy expansion and customization.

## Architecture

![[Full architecture.png](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/Full%20architecture.png)](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/Full%20architecture.png)


## Instruction

### Integer Arithmetic:

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/add.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/sub.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/and.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/or.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/srl.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/slt.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/addiu.png" width="800" height="200">
</div>

### Integer Memory Access:

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/lw.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/sw.png" width="800" height="200">
</div>

### Integer Branch:

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/beq.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/j.png" width="800" height="200">
</div>

### Integer Multiply:

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/multu.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/maddu.png" width="800" height="200">
</div>

### Other Instructions:

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/mfhi.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/mflo.png" width="800" height="200">
</div>

<div align=center>
<img src="https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/nop.png" width="800" height="200">
</div>
