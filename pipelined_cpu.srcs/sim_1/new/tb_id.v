`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2024 08:57:24 PM
// Design Name: 
// Module Name: tb_id
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


module tb_id();
reg clk;
reg z, n;
reg [31:0] test_instruction;
reg [31:0] test_pc;
reg [31:0] xrd;
wire [31:0] pc, adderOut;
wire jump, branch, reg_wrt, mem_two_reg, mem_wrt, mem_rd, save_pc, pcMuxSelect;
wire [2:0] alu_op;
wire [1:0] alu_src;
wire [31:0] xrs, xrt, imm;

wire branchNeg, branchZero;
and(branchNeg, n, branch);
and(branchZero, z, branch);
or(pcMuxSelect, jump, branchNeg, branchZero);


control_unit testControl(test_instruction[31:28], reg_wrt,alu_src, alu_op, save_pc, mem_wrt, mem_rd, mem_two_reg, branch, jump );
adder32 pcAdder(1, test_pc, adderOut); // PC + 1
register_file test_reg_file(xrt, xrs, xrd, test_instruction[27:22],test_instruction[15:10], test_instruction[21:16], reg_wrt, clk); // Reg file
imm_generator test_imm_gen(test_instruction, imm); // Immediate Gen
TwoToOneMux pcMux(adderOut, xrs , pcMuxSelect, pc); // PC or xrs mux select
id_ex_buffer id_buffer(clk, reg_wrt, mem_two_reg, mem_wrt, mem_rd, alu_op, alu_src, save_pc, test_pc, imm, xrs, xrt, test_instruction[27:22] );

initial
begin
    clk = 0;
    z = 0;
    n = 0;
    test_pc = 0;
    xrd = 0;
    test_instruction = 32'b0000_000000_000000_000000_0000000000;
    forever #5 clk = ~clk;
end

initial
begin

#20

$finish;
end

endmodule
