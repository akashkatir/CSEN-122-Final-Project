`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2024 05:37:27 PM
// Design Name: 
// Module Name: register
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


module data(clock, write, read, address, datain, dataout);
input clock, write, read;
input [31:0] address;
input [31:0] datain;
reg [31:0] data[65535:0];
output reg [31:0] dataout;

always@(posedge clock)
begin
    if(read == 1)
        dataout = data[address[15:0]];
    if(write == 1)
        data[address[15:0]] = datain;
end
endmodule

module instruction(clock, address, instruction_out);
input clock;
input [7:0] address;
wire [31:0] instructions [255:0];
output reg [31:0] instruction_out;

assign instructions[100] = 1024;
assign instructions[255] = 52;

always@(posedge clock)
begin
    instruction_out = instructions[address];
end
endmodule

module register(clock, write, rs, rt, rd, datain, rs_out, rt_out);
input clock, write;
input [5:0] rs;
input [5:0] rt;
input [5:0] rd;
input [31:0] datain;
reg[31:0] registers[63:0];
output reg[31:0] rs_out;
output reg[31:0] rt_out;

always@(posedge clock)
begin
    if (write == 0)
    begin
        rs_out = registers[rs];
        rt_out = registers[rt];
    end
    if(write == 1)
        registers[rd] = datain;
 end
 endmodule