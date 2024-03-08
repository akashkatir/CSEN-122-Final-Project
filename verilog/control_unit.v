`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2024 05:31:27 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(opcode, regWrite, aluSrc, aluOp, savePc, memWrite, memRead, MemtoReg, branch, jump);
input [3:0] opcode;
output reg [2:0] aluOp;
output reg [1:0] aluSrc;
output reg regWrite, savePc, memWrite, memRead, MemtoReg, branch, jump;

always@(opcode)
begin

if (opcode == 4'b0000) //No aluOp
begin
     regWrite = 0;
     aluSrc = 2'b00;
     aluOp = 3'b000; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b1111) //Save PC
begin
     regWrite = 1;
     aluSrc = 2'b01;
     aluOp = 3'b100; 
     savePc = 1;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b1110) //load
begin
     regWrite = 1;
     aluSrc = 2'b00;
     aluOp = 3'b000; 
     savePc = 0;
     memWrite = 0;
     memRead = 1;
     MemtoReg = 1;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b0011) //store
begin
     regWrite = 0;
     aluSrc = 2'b00;
     aluOp = 3'b000; 
     savePc = 0;
     memWrite = 1;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b0100) //add
begin
     regWrite = 1;
     aluSrc = 2'b00;
     aluOp = 3'b100; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b0101) //inc
begin
     regWrite = 1;
     aluSrc = 2'b01;
     aluOp = 3'b100; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b0110) //neg
begin
     regWrite = 1;
     aluSrc = 2'b10;
     aluOp = 3'b010; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b0111) //sub
begin
     regWrite = 1;
     aluSrc = 2'b00;
     aluOp = 3'b001; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 0;
end

if (opcode == 4'b1000) //jump
begin
     regWrite = 0;
     aluSrc = 2'b00;
     aluOp = 3'b000; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 0;
     jump = 1;
end

if (opcode == 4'b1001) //branch zero
begin
     regWrite = 0;
     aluSrc = 2'b00;
     aluOp = 3'b000; 
     savePc = 0;
     memWrite = 0;
     memRead = 0;    MemtoReg = 0;
     branch = 1;
     jump = 0;
end

if (opcode == 4'b1011) //branch neg
begin
     regWrite = 0;
     aluSrc = 2'b00;
     aluOp = 3'b000; 
     savePc = 1;
     memWrite = 0;
     memRead = 0;
     MemtoReg = 0;
     branch = 1;
     jump = 0;
end

end
endmodule
