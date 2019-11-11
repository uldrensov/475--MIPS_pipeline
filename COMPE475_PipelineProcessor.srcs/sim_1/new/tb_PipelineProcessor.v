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
    reg CLK = 0;
    
    wire ZERO;
    
    
    //IF stage
    PC PC(.CLK(CLK), .STALL(), .PCnext(), .PCcurr());
        ALU_PC_incr ALU_PC_incr(.curr(), .next());
        MUX_1b MUXintoPCnext(.in0(), .in1(), .sel(), .out());
    IM IM();
    PIP_REG_IFtoID PIP_REG_IFtoID(.CLK(CLK));
    
    //ID stage
    CTRL_main CTRL_main(.opcode());
        EQ EQ(.in0(), .in1(), .equal());
        AND_1b BRANCHgate(.in0(), .in1(), .out());
    CTRL_ALUOp CTRL_ALUOp(.ALUOp(), .funct(), .ALUsel());
    RF RF(.CLK(CLK));
    ALU_adder BTAadder(.in0(), .in1(), .out());
    PIP_REG_IDtoEX PIP_REG_IDtoEX(.CLK(CLK));
    
    //EX stage
    ALU ALU();
    PIP_REG_EXtoMEM PIP_REG_EXtoMEM(.CLK(CLK));
    
    //MEM stage
    DM DM(.CLK(CLK));
    PIP_REG_MEMtoWB PIP_REG_MEMtoWB(.CLK(CLK));
    
    //WB stage
    MUX_1b MUXintoRFWD();
    
    
    always #2 CLK = ~CLK;
    initial #2000 $finish;
endmodule

//TODO:
//write-first RF
//parameterise SE
//sequential will not infer latch
