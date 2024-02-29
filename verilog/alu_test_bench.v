`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2024 06:45:55 PM
// Design Name: 
// Module Name: alu_test_bench
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


module alu_test_bench();
    reg [31:0] A;
    reg[31:0] B;
    reg add, inc, neg, sub;
    wire [31:0] out;
    wire Z, N;
    alu test(A,B,add,inc,neg,sub,out,Z,N);
    initial begin
        A = 3;
        B = 4;
        add = 1;
        inc = 0;
        neg = 0;
        sub = 0;
        
        #50
        add = 0;
        inc = 1;
        neg = 0;
        sub = 0;
        
        #50
        add = 0;
        inc = 0;
        neg = 1;
        sub = 0;
        
        #50
        A = 3;
        B = 2;
        add = 0;
        inc = 0;
        neg = 0;
        sub = 1;
        
        #50
        A = 20;
        B = 2;
        add = 0;
        inc = 0;
        neg = 0;
        sub = 0;
        
        #50
        A = 127;
        B = 127;
        add = 0;
        inc = 0;
        neg = 0;
        sub = 1;
        
        #50
        add = 1;
        inc = 1;
        neg = 1;
        sub = 1;
        
    $finish;
    end
endmodule
