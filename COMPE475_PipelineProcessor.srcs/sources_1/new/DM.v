`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 09:46:29 PM
// Design Name: 
// Module Name: DM
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


//DATA MEMORY
module DM #(parameter addrW=17, WL=32)
(input CLK, DMWE, input[addrW-1:0] DMA, input signed[WL-1:0] DMWD,
    output reg signed[WL-1:0] DMRD);

    reg[WL-1:0] RAM[2**addrW-1:0];
    
    initial begin
        RAM[0] = 17;
        RAM[1] = 31;
        RAM[2] = -5;
        RAM[3] = -2;
        RAM[4] = 250;
    end
    
    always @(posedge CLK)
        //sync enabled write
        if (DMWE) RAM[DMA] <= DMWD;
    
    always @(*)
        //unconditional async read
        DMRD <= RAM[DMA];
endmodule
