`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2024 08:13:03 PM
// Design Name: 
// Module Name: tb_ID
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


module tb_if();
reg clk;
reg [31:0] pcIn;
wire [31:0] pcOut;
wire [31:0] instr_in;
wire [31:0] test_pc_out;
wire [31:0] test_instr_out;

PC test_pc(pcIn,pcOut,clk);
instruction_memory test_instr_mem(instr_in, pcOut[7:0], clk);
if_id_buffer test_id_buffer(clk, instr_in, pcOut, test_instr_out, test_pc_out);


initial
begin
    clk = 0;
    pcIn = 0;
    forever #5 clk = ~clk;
end

initial 
begin

// loop pc through # of instructions in I-cache
for(integer i = 0; i < 16; i = i +1)
begin
    #10
    pcIn = i;
end


$finish;
end

endmodule
