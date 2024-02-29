`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 05:34:44 PM
// Design Name: 
// Module Name: MUX
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


module MUX(A,B,C,D,sel,out);
input A,B,C,D;
input [1:0] sel;
output out;

not(notsel0, sel[0]);
assign notsel1 = ~sel[1];

and(outA, A, ~sel[1], ~sel[0]);
and(outB, B, notsel1, sel[0]);
and(outC, C, sel[1], notsel0);

assign outD = (D & sel[1] & sel[0]);
assign out = (outA | outB | outC | outD);
endmodule
