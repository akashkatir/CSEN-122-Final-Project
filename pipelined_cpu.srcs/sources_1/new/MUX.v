`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2024 07:17:22 PM
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


module FourToOneMux(input [31:0] A, 
                    input [31:0] B, 
                    input [31:0] C, 
                    input [31:0] D, 
                    input [1:0] select, 
                    output reg [31:0] out);
always@(A,B,C,D,select)
begin
    case(select)
     2'b00:
        assign out = A;
     2'b01:
        assign out = B;
     2'b10:
        assign out = C;
     2'b11:
        assign out = D;
     endcase
end
endmodule

module TwoToOneMux(input [31:0] A, input [31:0] B, input select, output reg [31:0] out);

always@(A,B,select)
begin
    case(select)
     1'b0:
        assign out = A;
     1'b1:
        assign out = B;
     endcase
end
endmodule
