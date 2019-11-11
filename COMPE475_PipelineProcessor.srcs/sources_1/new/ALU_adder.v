`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 09:58:57 PM
// Design Name: 
// Module Name: ALU_adder
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


//ADDER
module ALU_adder #(parameter WL=32)
(input [WL-1:0] in0, in1, output [WL-1:0] out);

    assign out = in0 + in1;
endmodule
