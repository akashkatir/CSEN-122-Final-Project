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

// update pcIn to change instruction fetch (no automatic increment as we only have If stage implemented in this tb

// change below values with real decoded instructions
// test pc = 0
// instr = ffffffff
# 20

// test pc = 1 after next clock cycle
// instr = 00ff00ff after next clock cycle
pcIn = 1;
#20

$finish;
end

endmodule
