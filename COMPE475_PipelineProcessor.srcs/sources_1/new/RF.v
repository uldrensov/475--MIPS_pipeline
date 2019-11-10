`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 09:38:17 PM
// Design Name: 
// Module Name: RF
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


//REGISTER FILE
module RF #(parameter addrW=5, WL=32)
(input CLK, RFWE, input[addrW-1:0] RFRA1, RFRA2, RFWA, input signed[WL-1:0] RFWD,
    output reg signed[WL-1:0] RFRD1, RFRD2);

    reg[WL-1:0] RAM[2**addrW-1:0];
    
    //init register 0
    initial RAM[0] = 0;
    
    always @(posedge CLK)
        //sync enabled write
        if (RFWE) RAM[RFWA] <= RFWD;
    
    always @(*) begin
        //unconditional async read
        RFRD1 <= RAM[RFRA1];
        RFRD2 <= RAM[RFRA2];
    end
endmodule
