`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 04:15:26 PM
// Design Name: 
// Module Name: EQ
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


//EQUALITY COMPARATOR
module EQ #(parameter WL=32)
(input[WL-1:0] in0, in1, output reg equal);

    initial equal = 0;
    always@(*) equal <= (in0 == in1)? 1:0;
endmodule
