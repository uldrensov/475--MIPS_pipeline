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


//1b-SELECT MUX (SIGNED)
module MUX_1b #(parameter WL=32)
(input signed[WL-1:0] in0, in1, input sel, output reg signed[WL-1:0] out);

    always @(*) begin
        case (sel)
            0: out <= in0;
            1: out <= in1;
            default: out <= in0;
        endcase
    end
endmodule
