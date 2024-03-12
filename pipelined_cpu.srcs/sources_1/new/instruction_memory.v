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


always@(negedge  clk)
begin
    instructionMem[0] = 'hffffffff;
    instructionMem[1] = 'h00ff00ff;
    instruction = instructionMem[address];
end
endmodule