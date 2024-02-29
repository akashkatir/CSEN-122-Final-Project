`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 05:38:47 PM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    
    reg A,B,C,D;
    reg [1:0] sel;
    wire out;
    MUX test(A,B,C,D,sel,out);
    
    initial
        begin
            A = 1;
            B = 0;
            C = 0;
            D = 0;
            
            sel = 2'b00;
            #50
            
            sel[1] = 0;
            sel[0] = 1;
            #50
            
            sel[1] = 1;
            sel[0] = 0;
            
            #50
            
            sel = 3;
            #50
            
            B=1;
            sel = 2'b01;
            #50
            $finish;
      end
            
endmodule
