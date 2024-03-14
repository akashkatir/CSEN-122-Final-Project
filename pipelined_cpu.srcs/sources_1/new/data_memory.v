`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 08:41:27 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(output reg [31:0] data_out, 
                   input [31:0]  data_in, 
                   input [31:0] address, 
                   input read, 
                   input write, 
                   input clk);
// Limit memory to 2^16 address for simulation purposes
reg [31:0] memory [65535:0];

initial
begin
    memory[0] = 5;
    memory[1] = 10;
    memory[2] = 15;
    memory[3] = 1;
    memory[4] = 100;
end

always@(negedge clk)
begin
    if(read)begin
        data_out = memory[address[15:0]];
    end
    
    if(write)begin
        memory[address[15:0]] = data_in;
    end
end

endmodule