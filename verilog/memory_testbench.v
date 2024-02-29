`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2024 05:57:47 PM
// Design Name: 
// Module Name: memory_testbench
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


module testbench();

reg clock;
reg [7:0] instr_address;
wire [31:0] instr;
instruction test_instruction(clock, instr_address, instr);

reg reg_write;
reg [5:0] rs;
reg [5:0] rt;
reg [5:0] rd;
reg [31:0] reg_datain;
wire [31:0] rs_out;
wire [31:0] rt_out;
register test_register(clock, reg_write, rs, rt, rd, reg_datain, rs_out, rt_out);

reg data_write, data_read;
reg [31:0] data_address;
reg [31:0] data_in;
wire [31:0] data_out;
data test_data(clock, data_write, data_read, data_address, data_in, data_out);

initial
begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial
begin
    instr_address = 100;
    #50
    instr_address = 255;
    
    #50
    reg_write = 1;
    reg_datain = 65535;
    rd = 60;
    #50
    reg_datain = 161;
    rd = 11;
    
    #50
    reg_write = 0;
    rs = 60;
    rt = 11;
    
    #50
    data_write = 1;
    data_read = 0;
    data_address = 2;
    data_in = 256;
    
    #50
    data_write = 0;
    data_read = 1;
    #50
    
    data_address = 20;
    #50
    
    $finish;
end
    
    
endmodule
