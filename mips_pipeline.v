//	Title: MIPS Pipeline Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
`timescale 1ns/1ns
module mips_pipeline( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
    wire[31:0] instr_reg;
    wire en_reg ;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct, funct_out;
    wire [4:0] rs, rt, rd, rt2EX, rd2EX, shamt, shamt_out;
    wire [15:0] immed;
    wire [31:0] extend_immed, extend_immed2EX, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [4:0] rfile_wn2MEM, rfile_wn2WB ;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_ans, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr, alu_out, rd2WB, addr2WB;
    wire [31:0] pc_incr_reg;
    wire [31:0] rfile_rd1_2EX, rfile_rd2_2EX, rfile_rd2_2MEM;
	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump;
    wire RegWrite2EX, RegDst2EX, MemtoReg2EX, MemRead2EX, MemWrite2EX, ALUSrc2EX;
    wire MemRead2MEM, MemWrite2MEM, RegWrite2MEM, MemtoReg2MEM;
    wire RegWrite2WB, MemtoReg2WB;
    wire [1:0] ALUOp;
    wire [1:0] ALUOp2EX;
    wire [2:0] Operation;


    wire mul_sel;
    wire [1:0] alu_sel;
    wire [63:0] Mulout, MulAns, mul_mux_out;
    wire [31:0] HiOut, LoOut, ALU_MUX_OUT;


	
    assign opcode = instr_reg[31:26];
    assign rs = instr_reg[25:21];
    assign rt = instr_reg[20:16];
    assign rd = instr_reg[15:11];
    assign shamt = instr_reg[10:6];
    assign funct = instr_reg[5:0];
    assign immed = instr_reg[15:0];
    assign jumpoffset = instr_reg[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset <<2 };

	// module instantiations
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );    // DONE
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );  // DONE
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );     // DONE

    add32 BRADD( .a(pc_incr_reg), .b(b_offset), .result(b_tgt) );   // DONE

    TotalALU ALU( .ctl(Operation), .a(rfile_rd1_2EX), .b(alu_b), .shamt(shamt_out), .result(alu_ans));     // DONE

    and BR_AND(PCSrc, Branch, Zero);    // DONE

    mux2 #(5) RFMUX( .sel(RegDst2EX), .a(rt2EX), .b(rd2EX), .y(rfile_wn) );  // DONE

    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt), .y(branch_addr) );       // DONE
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );     // DONE
	
    mux2 #(32) ALUMUX( .sel(ALUSrc2EX), .a(rfile_rd2_2EX), .b(extend_immed2EX), .y(alu_b) );    // DONE

    mux2 #(32) WRMUX( .sel(MemtoReg2WB), .a(addr2WB), .b(rd2WB), .y(rfile_wd) );    // DONE

    control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch),    // DONE
                       .Jump(Jump), .ALUOp(ALUOp));     

	
	reg_file RegFile( .clk(clk), .RegWrite(RegWrite2WB), .RN1(rs), .RN2(rt), .WN(rfile_wn2WB),       // DONE 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );       // DONE

	memory DatMem( .clk(clk), .MemRead(MemRead2MEM), .MemWrite(MemWrite2MEM), .wd(rfile_rd2_2MEM),      // DONE
				   .addr(alu_out), .rd(dmem_rdata) );	   

    Branch_equal equ(.rd1(rfile_rd1), .rd2(rfile_rd2), .zero(Zero));    // DONE

    IF_2_ID if_2_id(.clk(clk), .rst(rst), .pc_in(pc_incr), .ins_in(instr), .pc_out(pc_incr_reg), .ins_out(instr_reg));  // DONE

    ID_2_EX id_2_ex(.clk(clk), .rst(rst),                                                                           // DONE
                    .RegDst_in(RegDst),  .ALUOp_in(ALUOp),  .ALUSrc_in(ALUSrc),  .MemRead_in(MemRead),  .MemWrite_in(MemWrite),  .RegWrite_in(RegWrite),  .MemtoReg_in(MemtoReg), .funct_in(funct),
                        .RD1_in(rfile_rd1),  .RD2_in(rfile_rd2),  .immed_in(extend_immed),  .rt_in(rt),  .rd_in(rd), .shamt_in(shamt),
                    .RegDst_out(RegDst2EX),  .ALUOp_out(ALUOp2EX),  .ALUSrc_out(ALUSrc2EX),  .MemRead_out(MemRead2EX),  .MemWrite_out(MemWrite2EX),  .RegWrite_out(RegWrite2EX),  .MemtoReg_out(MemtoReg2EX), .funct_out(funct_out),
                        .RD1_out(rfile_rd1_2EX), .RD2_out(rfile_rd2_2EX), .immed_out(extend_immed2EX), .rt_out(rt2EX), .rd_out(rd2EX), .shamt_out(shamt_out));
    
    EX_2_MEM ex_2_mem(.clk(clk), .rst(rst),
                    .MemRead_in(MemRead2EX),  .MemWrite_in(MemWrite2EX),  .RegWrite_in(RegWrite2EX),  .MemtoReg_in(MemtoReg2EX),  // DONE
                        .ALU_in(ALU_MUX_OUT),  .RD2_in(rfile_rd2_2EX),  .WN_in(rfile_wn),
                    .MemRead_out(MemRead2MEM), .MemWrite_out(MemWrite2MEM), .RegWrite_out(RegWrite2MEM), .MemtoReg_out(MemtoReg2MEM),
                        .ALU_out(alu_out), .RD2_out(rfile_rd2_2MEM), .WN_out(rfile_wn2MEM));
    
    MEM_2_WB mem_2_wb(.clk(clk), .rst(rst),
                    .RegWrite_in(RegWrite2MEM),  .MemtoReg_in(MemtoReg2MEM),
                        .ADDR_in(alu_out),  .RD_in(dmem_rdata),  .WN_in(rfile_wn2MEM),      // DONE
                    .RegWrite_out(RegWrite2WB), .MemtoReg_out(MemtoReg2WB), 
                        .ADDR_out(addr2WB), .RD_out(rd2WB), .WN_out(rfile_wn2WB)); 

    alu_ctl ALUCTL( .ALUOp(ALUOp2EX), .Funct(funct_out), .ALUOperation(Operation), .sel2(mul_sel), .sel3(alu_sel) );        // DONE

    Multiplier mul(.clk(clk), .dataA(rfile_rd1_2EX), .dataB(rfile_rd2_2EX), .Signal(Operation), .dataOut(Mulout), .reset(rst), .en_reg(en_reg));
    
    HiLo hilo(.clk(clk), .MulAns(MulAns), .HiOut(HiOut), .LoOut(LoOut), .reset(rst), .en_reg(en_reg));
    mul_mux MULMUX( .sel(mul_sel), .a(64'b0), .b1(HiOut), .b2(LoOut), .y(mul_mux_out) );  
    add64 MULADD( .a(Mulout), .b(mul_mux_out), .result(MulAns) );
    mux3 #(32) ALU_out_mux( .a(LoOut), .b(HiOut), .c(alu_ans), .sel(alu_sel), .y(ALU_MUX_OUT) );
endmodule
