# Project Name: Pipelined MIPS-Lite CPU with Verilog

## Table of Contents:

- [Description](#description)
- [Development Environment](#development-environment)
- [Features](#features)
- [Architecture](#architecture)
- [Instruction](#instruction)

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

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/add.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/sub.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/and.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/or.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/srl.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/slt.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/addiu.png)

### Integer Memory Access:

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/lw.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/sw.png)

### Integer Branch:

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/beq.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/j.png)

### Integer Multiply:

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/multu.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/maddu.png)

### Other Instructions:

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/mfhi.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/mflo.png)

![](https://github.com/Xiao-E5B08F/Pipelined-MIPS-Lite-CPU-with-Verilog/blob/main/PICs/nop.png)
