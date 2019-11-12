`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 09:55:39 PM
// Design Name: 
// Module Name: PC
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


//PROGRAM COUNTER
module PC #(parameter addrW=17)
(input CLK, STALL, input[addrW-1:0] PCnext, output reg[addrW-1:0] PCcurr);

    initial PCcurr = 0;
    always @(posedge CLK)
        if (!STALL) PCcurr <= PCnext;
endmodule
