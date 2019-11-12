`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 10:57:52 PM
// Design Name: 
// Module Name: ALU_PC_incr
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


//PC INCREMENTER
module ALU_PC_incr #(parameter addrW=17)
(input[addrW-1:0] curr, output[addrW-1:0] next);

    assign next = curr+1;
endmodule
