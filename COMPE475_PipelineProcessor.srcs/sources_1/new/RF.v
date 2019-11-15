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
module RF #(parameter wid=32, dep=5)
(input CLK, RFWE, input[dep-1:0] RFRA1, RFRA2, RFWA, input signed[wid-1:0] RFWD,
    output reg signed[wid-1:0] RFRD1, RFRD2);

    reg[wid-1:0] RAM[2**dep-1:0];
    
    //init $0
    initial RAM[0] = 0;
    
    always @(negedge CLK) begin
        //sync; write-first
        if (RFWE) RAM[RFWA] = RFWD;
        RFRD1 = RAM[RFRA1];
        RFRD2 = RAM[RFRA2];
    end
endmodule
