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

initial
begin

    //ADD x5, x2, x3
    instructionMem[0] = 32'b0100_000101_000010_000011_0000000000;

    //SVPC x9, 2
    instructionMem[1] = 32'b1111_001001_000000_000000_0000000010;

    //SVPC x10, 11
    instructionMem[2] = 32'b1111_001010_000000_000000_0000001011;

    //LD x6, x2
    instructionMem[3] = 32'b1110_000110_000010_000000_0000000000;

   //NOP
    instructionMem[4] = 32'b0000_000000_000000_000000_0000000000;

   //NOP
    instructionMem[5] = 32'b0000_000000_000000_000000_0000000000;

//    //SUB x7, x6, x4
//    instructionMem[6] = 32'b0111_000111_000110_000100_0000000000;

    // SUB x7, x4, x6
    instructionMem[6] = 32'b0111_000111_000110_000100_0000000000;

    //BRN x10
    instructionMem[7] = 32'b1011_000000_001010_000000_0000000000;
    
    //NOP
    instructionMem[8] = 32'b0000_000000_000000_000000_00000000000;
 
    //SUB x4, x4, x4
    instructionMem[9] = 32'b0111_000100_000100_000100_0000000000;

    //NOP
    instructionMem[10] = 32'b0000_000000_000000_000000_0000000000;

    //NOP
    instructionMem[11] = 32'b0000_000000_000000_000000_0000000000;

    //ADD x4, x4, x6
    instructionMem[12] = 32'b0100_000100_000100_000110_0000000000;

    //INC x2, x2, 1
    instructionMem[13] = 32'b0101_000010_000010_000000_0000000001;

    //NOP
    instructionMem[14] = 32'b0000_000000_000000_000000_0000000000;

    //NOP
    instructionMem[15] = 32'b0000_000000_000000_000000_0000000000;

//    //SUB x8, x2, x5
//    instructionMem[16] = 32'b0111_001000_000010_000101_0000000000;

    //SUB x8, x5, x2
    instructionMem[16] = 32'b0111_001000_000101_000010_0000000000;

    //BRN x9
    instructionMem[17] = 32'b1011_000000_001001_000000_0000000000;
 
    //NOP
    instructionMem[18] = 32'b0000_000000_000000_000000_0000000000;

    

end

always@(negedge  clk)
begin
    instruction = instructionMem[address];
end

endmodule