`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 08:41:27 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(output reg [31:0] instruction, input [7:0] address, input clk);
reg [31:0] instructionMem [255:0];


begin
    //LD x6, x2
    instructionMem[0] = 32'b11100001100000100000000000000000;

    //SUB x4, x4, x4
    instructionMem[1] = 32'b01110001000001000001000000000000;

    //ADD x5, x2, x3
    instructionMem[2] = 32'b01000001010000100000110000000000;

    //SVPC x9, 2
    instructionMem[3] = 32'b11110010010000000000000000000010;

    //SVPC x10, 6
    instructionMem[4] = 32'b11110010100000000000000000000110;

    //SUB x4, x4, x4
    instructionMem[5] = 32'b01110001000001000001000000000000;

    //NOP
    instructionMem[6] = 32'b00000000000000000000000000000000;

    //NOP
    instructionMem[7] = 32'b00000000000000000000000000000000;

    //SUB x7, x6, x4
    instructionMem[8] = 32'b01110001110001100001000000000000;

    //BRN x10
    instructionMem[9] = 32'b10110000000101000000000000000000;

    //INC x2, x2, 1
    instructionMem[10] = 32'b01010000100000100000000000000001;

    //ADD x4, x4, x6
    instructionMem[11] = 32'b01000001000001000001100000000000;

    //NOP
    instructionMem[12] = 32'b00000000000000000000000000000000;

    //SUB x8, x2, x5
    instructionMem[13] = 32'b00110010000000100001010000000000;

    //BRN x9
    instructionMem[14] = 32'b10110000000010010000000000000000;

end

always@(negedge  clk)
    instruction = instructionMem[address];

endmodule