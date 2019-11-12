`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 03:51:50 PM
// Design Name: 
// Module Name: PIP_REG_IDtoEX
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


//PIPELINE REGISTER: DECODE TO EXECUTE
module PIP_REG_IDtoEX #(parameter WL=32)
(input CLK, RFWE_ID, DMWE_ID, MtoRFsel_ID, RFDsel_ID, ALUInsel_ID,
    input[2:0] ALUsel_ID, input[4:0] rs_ID, rt_ID, rd_ID, shamt_ID,
    input signed[WL-1:0] OPRND1_ID, OPRND2_ID, simm_ID,
    output reg RFWE_EX, DMWE_EX, MtoRFsel_EX, RFDsel_EX, ALUInsel_EX,
    output reg[2:0] ALUsel_EX, output reg[4:0] rs_EX, rt_EX, rd_EX, shamt_EX,
    output reg signed[WL-1:0] OPRND1_EX, OPRND2_EX, simm_EX);

    always @(posedge CLK) begin
        ALUsel_EX <= ALUsel_ID;
        RFWE_EX <= RFWE_ID;
        DMWE_EX <= DMWE_ID;
        MtoRFsel_EX <= MtoRFsel_ID;
        RFDsel_EX <= RFDsel_ID;
        ALUInsel_EX <= ALUInsel_ID;
        
        rs_EX <= rs_ID;
        rt_EX <= rt_ID;
        rd_EX <= rd_ID;
        shamt_EX <= shamt_ID;
        
        OPRND1_EX <= OPRND1_ID;
        OPRND2_EX <= OPRND2_ID;
        simm_EX <= simm_ID;
    end
endmodule
