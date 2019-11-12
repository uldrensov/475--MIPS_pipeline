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


//16b TO (WL)b SIGN EXTENDER
module SE #(parameter WLout=32)
(input[15:0] imm, output signed[WLout-1:0] simm);

    assign simm = imm[15]? {16'hFFFF, imm}:{16'b0, imm};
endmodule
