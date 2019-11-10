`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 09:48:54 PM
// Design Name: 
// Module Name: ALU
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


//MAIN ALU
module ALU #(parameter WL=32)
(input[2:0] ALUsel, input[4:0] shamt, input signed[WL-1:0] ALUIn1, ALUIn2,
    output reg ZERO, output reg signed[WL-1:0] ALUOut);

    always @(*) begin
        case (ALUsel)
            3'b010: ALUOut = ALUIn1 + ALUIn2; //addition
            3'b110: ALUOut = ALUIn1 - ALUIn2; //subtraction
            3'b000: ALUOut = ALUIn1 & ALUIn2; //and
            3'b001: ALUOut = ALUIn1 | ALUIn2; //or
            3'b111: ALUOut = ALUIn1 < ALUIn2 ? 32'b1 : 32'b0; //SLT comparison
            3'b011: ALUOut = ALUIn2 << shamt; //shift left logical
            3'b100: ALUOut = ALUIn2 << ALUIn1; //shift left logical variable
            3'b101: ALUOut = ALUIn2 >>> ALUIn1; //shift right arith variable
        endcase
        
        //set zero flag if applicable
        if (ALUOut == 0) ZERO = 1;
        else ZERO = 0;
    end
endmodule
