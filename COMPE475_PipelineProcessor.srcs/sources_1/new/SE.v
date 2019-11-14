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
module SE #(parameter WL=32)
(input[15:0] imm, output reg signed[WL-1:0] simm);

    reg[WL-17:0] ext = 0;
    always @(*) simm <= imm[15]? {~ext, imm}:{ext, imm};
endmodule
