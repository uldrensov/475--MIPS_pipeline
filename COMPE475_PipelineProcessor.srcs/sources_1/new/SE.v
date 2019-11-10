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


//16b TO 32b SIGN EXTENDER
module SE(input[15:0] imm, output reg signed[31:0] simm);

    always @(*) simm <= imm[15]? {16'b1111111111111111, imm}:
        simm <= {16'b0, imm};
endmodule
