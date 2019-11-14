`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 10:05:57 PM
// Design Name: 
// Module Name: CTRL_main
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


//MAIN CONTROL UNIT
module CTRL_main(input[5:0] opcode,
    output reg RFWE, DMWE, BRANCH, JUMP, MtoRFsel, RFDsel, ALUInsel,
    output reg[1:0] ALUOp);
    
    initial BRANCH = 0;
    
    always @(*) begin
        //defaults
        RFWE = 0; DMWE = 0;
        BRANCH = 0; JUMP = 0;
        MtoRFsel = 1'bX; RFDsel = 1'bX; ALUInsel = 1'bX;
    
        case (opcode)
            6'b000000: begin //R-type
                ALUOp = 2'b10;
                RFWE = 1;
                MtoRFsel = 0; RFDsel = 1; ALUInsel = 0;
            end
            6'b100011: begin //lw
                ALUOp = 2'b00;
                RFWE = 1;
                MtoRFsel = 1; RFDsel = 0; ALUInsel = 1;
            end
            6'b101011: begin //sw
                ALUOp = 2'b00;
                DMWE = 1;
                ALUInsel = 1;
            end
            6'b000100: begin //beq
                ALUOp = 2'b01;
                BRANCH = 1;
                ALUInsel = 0;
            end
            6'b001000: begin //addi
                ALUOp = 2'b00;
                RFWE = 1;
                MtoRFsel = 0; RFDsel = 0; ALUInsel = 1;
            end
            6'b000010: begin //j
                ALUOp = 2'bX;
                JUMP = 1;
            end
        endcase
    end
endmodule
