`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 09:48:22 PM
// Design Name: 
// Module Name: tb_PipelineProcessor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_PipelineProcessor;
    parameter wid=32; //width of data word
    parameter dep=17; //depth of memory
    parameter RFdep= 5; //depth of RF
    parameter op_wid=2; //width of ALUOp
    parameter mode_wid=3; //width of ALUsel
    parameter sh_wid=5; //width of shamt
    
    
    reg CLK = 0;
    
    wire[dep-1:0] PCnextT1, PCnextT2, PCcurr, PCplus1_IF;
    wire[wid-1:0] instr_IF;
    
    wire[dep-1:0] PCplus1_ID;
    wire[wid-1:0] instr_ID;
    wire RFWE_ID, DMWE_ID, MtoRFsel_ID, RFDsel_ID, ALUInsel_ID;
    wire[mode_wid-1:0] ALUsel_ID;
    wire BRANCH, equal, BEQ, JUMP;
    wire[op_wid-1:0] ALUOp;
    wire signed[wid-1:0] RFRD1, RFRD2, OPRND1_ID, OPRND2_ID;
    wire signed[wid-1:0] simm_ID;
    wire[dep-1:0] BTA;
    
    wire RFWE_EX, DMWE_EX, MtoRFsel_EX, RFDsel_EX, ALUInsel_EX;
    wire[mode_wid-1:0] ALUsel_EX;
    wire[RFdep-1:0] rs_EX, rt_EX, rd_EX;
    wire[sh_wid-1:0] shamt;
    wire signed[wid-1:0] OPRND1_EX, OPRND2_EX, simm_EX;
    wire[RFdep-1:0] RFWA_EX;
    wire signed[wid-1:0] ALUIn2andDMWD;
    wire signed[wid-1:0] ALUIn1, ALUIn2, ALUOut_EX;
    
    wire RFWE_MEM, DMWE_MEM, MtoRFsel_MEM;
    wire[RFdep-1:0] RFWA_MEM;
    wire signed[wid-1:0] ALUOut_MEM, DMWD_MEM;
    
    wire signed[wid-1:0] DMRD_MEM;
    wire RFWE_WB, MtoRFsel_WB;
    wire[RFdep-1:0] RFWA_WB;
    wire signed[wid-1:0] ALUOut_WB, DMRD_WB, RFWD;
    
    wire STALL, FLUSH_IDtoEX;
    wire FW1_ID, FW2_ID;
    wire[1:0] FW1_EX, FW2_EX;
    
    
    //IF stage
    PC PC(.CLK(CLK), .STALL(STALL), .PCnext(PCnextT2), .PCcurr(PCcurr));
        ALU_incr ALU_incr(.in(PCcurr), .out(PCplus1_IF));
        MUX_1b #(dep)MUXintoPCnextT1(.in0(PCplus1_IF), .in1(BTA), .sel(BEQ), .out(PCnextT1));
        MUX_1b #(dep)MUXintoPCnextT2(.in0(PCnextT1), .in1({PCplus1_ID[31:26],instr_ID[25:0]}), .sel(JUMP), .out(PCnextT2));
    IM IM(.IMRA(PCcurr), .IMRD(instr_IF));
    PIP_REG_IFtoID PIP_REG_IFtoID(.CLK(CLK), .STALL(STALL), .RST(BEQ), .PCplus1_IF(PCplus1_IF), .instr_IF(instr_IF),
            .PCplus1_ID(PCplus1_ID), .instr_ID(instr_ID));
    
    //ID stage
    CTRL_main CTRL_main(.opcode(instr_ID[31:26]), .RFWE(RFWE_ID), .DMWE(DMWE_ID), .BRANCH(BRANCH), .JUMP(JUMP),
            .MtoRFsel(MtoRFsel_ID), .RFDsel(RFDsel_ID), .ALUInsel(ALUInsel_ID), .ALUOp(ALUOp));
        EQ EQ(.in0(OPRND1_ID), .in1(OPRND2_ID), .equal(equal));
        AND_1b BRANCHgate(.in0(BRANCH), .in1(equal), .out(BEQ));
    CTRL_ALU CTRL_ALU(.ALUOp(ALUOp), .funct(instr_ID[5:0]), .ALUsel(ALUsel_ID));
    RF RF(.CLK(CLK), .RFWE(RFWE_WB), .RFRA1(instr_ID[25:21]), .RFRA2(instr_ID[20:16]), .RFWA(RFWA_WB), .RFWD(RFWD),
            .RFRD1(RFRD1), .RFRD2(RFRD2));
        MUX_1b FWMUXintoOPRND1(.in0(RFRD1), .in1(ALUOut_MEM), .sel(FW1_ID), .out(OPRND1_ID));
        MUX_1b FWMUXintoOPRND2(.in0(RFRD2), .in1(ALUOut_MEM), .sel(FW2_ID), .out(OPRND2_ID));
    SE SE(.imm(instr_ID[15:0]), .simm(simm_ID));
    ALU_adder BTAadder(.in0(simm_ID), .in1(PCplus1_ID), .out(BTA));
    PIP_REG_IDtoEX PIP_REG_IDtoEX(.CLK(CLK), .RST(FLUSH_IDtoEX), .RFWE_ID(RFWE_ID), .DMWE_ID(DMWE_ID),
            .MtoRFsel_ID(MtoRFsel_ID), .RFDsel_ID(RFDsel_ID), .ALUInsel_ID(ALUInsel_ID), .ALUsel_ID(ALUsel_ID),
            .rs_ID(instr_ID[25:21]), .rt_ID(instr_ID[20:16]), .rd_ID(instr_ID[15:11]), .shamt_ID(instr_ID[10:6]),
            .OPRND1_ID(OPRND1_ID), .OPRND2_ID(OPRND2_ID), .simm_ID(simm_ID),
            .RFWE_EX(RFWE_EX), .DMWE_EX(DMWE_EX),
            .MtoRFsel_EX(MtoRFsel_EX), .RFDsel_EX(RFDsel_EX), .ALUInsel_EX(ALUInsel_EX), .ALUsel_EX(ALUsel_EX),
            .rs_EX(rs_EX), .rt_EX(rt_EX), .rd_EX(rd_EX), .shamt_EX(shamt),
            .OPRND1_EX(OPRND1_EX), .OPRND2_EX(OPRND2_EX), .simm_EX(simm_EX));
    
    //EX stage
    ALU ALU(.ALUsel(ALUsel_EX), .shamt(shamt), .ALUIn1(ALUIn1), .ALUIn2(ALUIn2), .ALUOut(ALUOut_EX));
        MUX_2b FWMUXintoALUIn1(.in0(OPRND1_EX), .in1(ALUOut_MEM), .in2(RFWD), .sel(FW1_EX), .out(ALUIn1));
        MUX_2b FWMUXintoALUIn2andDMWD(.in0(OPRND2_EX), .in1(ALUOut_MEM), .in2(RFWD), .sel(FW2_EX), .out(ALUIn2andDMWD));
        MUX_1b MUXintoALUIn2(.in0(ALUIn2andDMWD), .in1(simm_EX), .sel(ALUInsel_EX), .out(ALUIn2));
    MUX_1b MUXintoRFWA(.in0(rt_EX), .in1(rd_EX), .sel(RFDsel_EX), .out(RFWA_EX));
    PIP_REG_EXtoMEM PIP_REG_EXtoMEM(.CLK(CLK), .RFWE_EX(RFWE_EX), .DMWE_EX(DMWE_EX), .MtoRFsel_EX(MtoRFsel_EX),
            .RFWA_EX(RFWA_EX), .ALUOut_EX(ALUOut_EX), .DMWD_EX(ALUIn2andDMWD),
            .RFWE_MEM(RFWE_MEM), .DMWE_MEM(DMWE_MEM), .MtoRFsel_MEM(MtoRFsel_MEM),
            .RFWA_MEM(RFWA_MEM), .ALUOut_MEM(ALUOut_MEM), .DMWD_MEM(DMWD_MEM));
    
    //MEM stage
    DM #(wid,8)DM(.CLK(CLK), .DMWE(DMWE_MEM), .DMA(ALUOut_MEM), .DMWD(DMWD_MEM), .DMRD(DMRD_MEM));
    PIP_REG_MEMtoWB PIP_REG_MEMtoWB(.CLK(CLK), .RFWE_MEM(RFWE_MEM), .MtoRFsel_MEM(MtoRFsel_MEM),
            .RFWA_MEM(RFWA_MEM), .ALUOut_MEM(ALUOut_MEM), .DMRD_MEM(DMRD_MEM),
            .RFWE_WB(RFWE_WB), .MtoRFsel_WB(MtoRFsel_WB),
            .RFWA_WB(RFWA_WB), .ALUOut_WB(ALUOut_WB), .DMRD_WB(DMRD_WB));
    
    //WB stage
    MUX_1b MUXintoRFWD(.in0(ALUOut_WB), .in1(DMRD_WB), .sel(MtoRFsel_WB), .out(RFWD));
    
    //hazard unit
    HAZ HAZ(.RFWE_MEM(RFWE_MEM), .RFWE_WB(RFWE_WB), .BRANCH(BRANCH), .JUMP_ID(JUMP),
            .LW_EX(MtoRFsel_EX), .LW_MEM(MtoRFsel_MEM),
            .rs_ID(instr_ID[25:21]), .rt_ID(instr_ID[20:16]), .rs_EX(rs_EX), .rt_EX(rt_EX),
            .RFWA_EX(RFWA_EX), .RFWA_MEM(RFWA_MEM), .RFWA_WB(RFWA_WB),
            .STALL(STALL), .FLUSH_IDtoEX(FLUSH_IDtoEX), .FW1_ID(FW1_ID), .FW2_ID(FW2_ID),
            .FW1_EX(FW1_EX), .FW2_EX(FW2_EX));
    
    
    always #5 CLK = ~CLK;
    initial #1000 $finish;
endmodule
