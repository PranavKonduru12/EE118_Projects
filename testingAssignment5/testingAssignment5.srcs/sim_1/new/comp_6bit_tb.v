`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 03:49:24 PM
// Design Name: 
// Module Name: comp_6bit_tb
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


module comp_6bit_tb();
    reg [5:0] a6, b6;
    wire g6, e6, l6;
    
    six_bit_comp t1 (.a6(a6), .b6(b6), .g6(g6), .e6(e6), .l6(l6));
    
    initial
        begin
            #50 a6 = 6'b000000; b6 = 6'b000000;
            #50 a6 = 6'b000000; b6 = 6'b000001;
            #50 a6 = 6'b000001; b6 = 3'b000000;
            #50 a6 = 6'b111111; b6 = 6'b111111;
       end
endmodule
