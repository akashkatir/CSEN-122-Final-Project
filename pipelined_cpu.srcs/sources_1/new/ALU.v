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


module ALU(input [31:0] A, input [31:0] B, input [2:0] opcode, output reg [31:0] out, output Z, output  N);

always@(A, B, opcode)
begin
    case(opcode)
     3'b100:
        assign out =  A + B;
     3'b010:
        assign out = -B;
     3'b001:
        assign out = B - A;
     3'b111:
        assign out = A;
     endcase
end 
nor(Z, out[0], out[1],
           out[2], out[3], 
           out[4], out[5], 
           out[6], out[7], 
           out[8], out[9], 
           out[10], out[11], 
           out[12], out[13],
           out[14], out[15], 
           out[16], out[17], 
           out[18], out[19], 
           out[20], out[21],
           out[22], out[23],
           out[24], out[25],
           out[26], out[27], 
           out[28], out[29], 
           out[30], out[31]);
           
and(N, out[31], 1);  
endmodule


module adder32(input [31:0] A, input [31:0] B, output reg [31:0] out);

always@(A, B)
begin
    out = A + B;
end
endmodule