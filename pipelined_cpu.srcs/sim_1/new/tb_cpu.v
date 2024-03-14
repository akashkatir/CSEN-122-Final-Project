`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 10:31:34 PM
// Design Name: 
// Module Name: tp_cpu
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


module tb_cpu();
reg clock;
wire [31:0] pc_in, pc_out, i_cache_out;

// IF stage
PC Program_Counter(pc_in, pc_out, clock);
instruction_memory i_cache(i_cache_out, pc_out[7:0], clock);

// IF/ID
wire [31:0] if_instruction_out, if_pc_out;
if_id_buffer if_stage(clock, i_cache_out, pc_out, if_instruction_out, if_pc_out);


// ID stage
wire reg_wrt, save_pc, mem_wrt, mem_rd, mem_2_reg, branch_neg, branch_zero, jump;
wire [1:0] alu_src;
wire [2:0] alu_op;
wire [31:0] xrs, xrt, immidiate, pc_adder_out;
wire pc_mux_select;
wire branch_N, branch_Z;
and(branch_N, branch_neg, N);
and(branch_Z, branch_zero, Z);
or(pc_mux_select, branch_N, branch_Z, jump);


control_unit control(if_instruction_out[31:28], reg_wrt, alu_src, alu_op, save_pc, mem_wrt, mem_rd, mem_2_reg, branch_neg, branch_zero, jump );
register_file reg_file(xrt, xrs, xrd , ex_rd, if_instruction_out[15:10], if_instruction_out[21:16],ex_reg_wrt , clock);
imm_generator imm_gen(if_instruction_out, immidiate);
adder32 pc_adder(if_pc_out, 1, pc_adder_out);
TwoToOneMux pc_mux(pc_adder_out, xrs , pc_mux_select, pc_in);

// ID/EX
wire id_reg_wrt, id_mem_2_reg, id_mem_wrt, id_mem_rd, id_save_pc;
wire [2:0] id_alu_op;
wire [1:0] id_alu_src;
wire [31:0] id_pc, id_imm, id_xrs, id_xrt;
wire [5:0] id_rd;

id_ex_buffer id_stage(clock, reg_wrt, mem_2_reg, mem_wrt, mem_rd, alu_op, alu_src, save_pc, if_pc_out, immidiate, xrs, xrt,if_instruction_out[27:22],
                      id_reg_wrt, id_mem_2_reg, id_mem_wrt, id_mem_rd, id_alu_op, id_alu_src, id_save_pc, id_pc, id_imm, id_xrs, id_xrt, id_rd);

// EX stage
wire Z, N;
wire [31:0] b_src_mux_out, a_src_mux_out, alu_out, data_out;
FourToOneMux alu_b_src_mux(.A(id_xrt),.B( id_imm), .C(id_xrs), .select(id_alu_src),.out(b_src_mux_out));
TwoToOneMux alu_a_src_mux(id_xrs, id_pc, id_save_pc, a_src_mux_out);
ALU alu(a_src_mux_out, b_src_mux_out, id_alu_op, alu_out, Z, N );
data_memory d_cache(data_out, id_xrt, id_xrs, id_mem_rd, id_mem_wrt, clock);

// EX/WB
wire ex_reg_wrt, ex_mem_2_reg;
wire [5:0] ex_rd;
wire [31:0] ex_alu_out, ex_data_out;
ex_wb_buffer ex_stage(clock, id_mem_2_reg, id_reg_wrt, alu_out, data_out, id_rd, ex_mem_2_reg, ex_reg_wrt, ex_alu_out, ex_data_out, ex_rd);

// WB stage
wire [31:0] xrd;
TwoToOneMux mem_2_reg_mux(ex_alu_out, ex_data_out, ex_mem_2_reg, xrd);


initial
begin
    clock = 0;
    forever #5 clock = ~clock;
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
