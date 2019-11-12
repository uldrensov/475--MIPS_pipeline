`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 10:02:21 PM
// Design Name: 
// Module Name: AND_1b
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


//1b AND GATE
module AND_1b(input in0, in1, output reg out);

    initial out = 0;
    always@(*) out = in0 & in1;
endmodule
