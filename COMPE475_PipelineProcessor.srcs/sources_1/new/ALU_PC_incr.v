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


//INCREMENTER
module ALU_incr #(parameter WL=17)
(input[WL-1:0] in, output[WL-1:0] out);

    assign out = in+1;
endmodule
