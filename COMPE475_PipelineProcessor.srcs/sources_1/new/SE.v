`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 09:40:42 PM
// Design Name: 
// Module Name: SE
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


//SIGN EXTENDER
module SE #(parameter WLin=16, WLout=32)
(input[WLin-1:0] imm, output reg signed[WLout-1:0] simm);

    reg[WLout-WLin-1:0] ext = 0;
    always @(*) simm <= imm[WLin-1]? {~ext, imm}:{ext, imm};
endmodule
