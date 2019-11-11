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
(input[WLin-1:0] imm, output signed[WLout-1:0] simm);

    assign simm = imm[WLin-1]? {16'hFFFF, imm}:{16'b0, imm};
endmodule
