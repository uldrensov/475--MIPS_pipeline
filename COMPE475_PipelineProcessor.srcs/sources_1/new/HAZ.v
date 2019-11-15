`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 07:19:48 PM
// Design Name: 
// Module Name: HAZ
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


//HAZARD HANDLER UNIT
module HAZ #(parameter RFdep=5)
(input RFWE_EX, RFWE_MEM, RFWE_WB, BRANCH, JUMP_ID, LW_EX, LW_MEM,
    input[RFdep-1:0] rs_ID, rt_ID, rs_EX, rt_EX, RFWA_EX, RFWA_MEM, RFWA_WB,
    output STALL, output reg FLUSH_IDtoEX, FW1_ID, FW2_ID,
    output reg[1:0] FW1_EX, FW2_EX);

    reg LW_STALL, B_STALL;

    always @(*) begin
        //EX operand 1
        if ((rs_EX == RFWA_MEM) && RFWE_MEM) FW1_EX <= 1;
        else if ((rs_EX == RFWA_WB) && RFWE_WB) FW1_EX <= 2;
        else FW1_EX <= 0;
        
        //EX operand 2
        if ((rt_EX == RFWA_MEM) && RFWE_MEM) FW2_EX <= 1;
        else if ((rt_EX == RFWA_WB) && RFWE_WB) FW2_EX <= 2;
        else FW2_EX <= 0;
        
        //ID(branch) operand 1
        if ((rs_ID == RFWA_MEM) && RFWE_MEM && BRANCH) FW1_ID <= 1;
        else FW1_ID <= 0;
        
        //ID(branch) operand 2
        if ((rt_ID == RFWA_MEM) && RFWE_MEM && BRANCH) FW2_ID <= 1;
        else FW2_ID <= 0;
        
        //LW STALL (if LW is EX and dependent is in ID, stall 1 and flush the stage between)
        if (((rs_ID == RFWA_EX) || (rt_ID == RFWA_EX)) && LW_EX && !JUMP_ID) begin
            LW_STALL <= 1;
            FLUSH_IDtoEX <= 1;
        end
        else begin
            LW_STALL <= 0;
            FLUSH_IDtoEX <= 0;
        end
        
        //BRANCH STALL (if branch instr (in ID) is dependent on instr in EX, or LW in MEM, stall 1)
        if ((((rs_ID == RFWA_EX) || (rt_ID == RFWA_EX)) && RFWE_EX && BRANCH) ||
        (((rs_ID == RFWA_MEM) || (rt_ID == RFWA_MEM)) && LW_MEM && BRANCH))
            B_STALL <= 1;
        else B_STALL <= 0;
    end
    
    assign STALL = LW_STALL | B_STALL; //either stall flag will trigger a stall
endmodule
