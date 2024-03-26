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


module tb_id();;
reg z, n;
reg [31:0] xrd;
wire [31:0] pc_adder_out;
wire jump, branch, reg_wrt, mem_two_reg, mem_wrt, mem_rd, save_pc, pcMuxSelect;
wire [2:0] alu_op;
wire [1:0] alu_src;
wire [31:0] xrs, xrt, imm;

reg clk;
wire [31:0] pcOut;
wire [31:0] instr_in;
wire [31:0] pc_in;
wire [31:0] if_instruction_out;
wire [31:0] if_pc_out;

PC test_pc(pc_in,pcOut,clk);
instruction_memory test_instr_mem(instr_in, pcOut[7:0], clk);
if_id_buffer test_id_buffer(clk, instr_in, pcOut, if_instruction_out, if_pc_out);

wire branchNeg, branchZero;
and(branchNeg, n, branch);
and(branchZero, z, branch);
or(pcMuxSelect, jump, branchNeg, branchZero);


control_unit testControl(if_instruction_out[31:28], reg_wrt,alu_src, alu_op, save_pc, mem_wrt, mem_rd, mem_two_reg, branch, jump );
adder32 pcAdder(1, if_pc_out, pc_adder_out); // PC + 1
register_file test_reg_file(xrt, xrs, xrd, if_instruction_out[27:22],if_instruction_out[15:10], if_instruction_out[21:16], reg_wrt, clk); // Reg file
imm_generator test_imm_gen(if_instruction_out, imm); // Immediate Gen
TwoToOneMux pcMux(pc_adder_out, xrs , pcMuxSelect, pc_in); // PC or xrs mux select
id_ex_buffer id_buffer(clk, reg_wrt, mem_two_reg, mem_wrt, mem_rd, alu_op, alu_src, save_pc, if_pc_out, imm, xrs, xrt, if_instruction_out[27:22] );

initial
begin
    clk = 0;
    z = 0;
    n = 0;
    xrd = 0;
    forever #5 clk = ~clk;
end

initial
begin

for(integer i = 0; i < 50; i = i+1)
begin
    #10;
end

$finish;
end

endmodule
