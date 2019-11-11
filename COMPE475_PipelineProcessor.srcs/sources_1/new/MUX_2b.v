`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 07:15:16 PM
// Design Name: 
// Module Name: MUX_2b
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


//2b-SELECT MUX
module MUX_2b #(parameter WL=32)
(input[WL-1:0] in0, in1, in2, input[1:0] sel,
    output reg[WL-1:0] out);
    
    always @(*) begin
        case (sel)
            0: out <= in0;
            1: out <= in1;
            2: out <= in2;
        endcase
    end
endmodule
