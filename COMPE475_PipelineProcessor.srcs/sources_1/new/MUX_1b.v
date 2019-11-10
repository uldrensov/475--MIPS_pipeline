`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 09:59:53 PM
// Design Name: 
// Module Name: MUX_1b
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


//1b-SELECT MUX
module MUX_1b #(parameter WL=32)
(input[WL-1:0] in0, in1, input sel, output reg[WL-1:0] out);

    always @(*) out <= sel? in1:in0;
endmodule
