`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 04:32:38 PM
// Design Name: 
// Module Name: comp_5bit_tb
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


module comp_5bit_tb();
    reg [4:0] a5, b5;
    wire g5, e5, l5;
    
    comp_5_bit t1 (.a5(a5), .b5(b5), .g5(g5), .e5(e5), .l5(l5));
    
    initial
        begin
            #50 a5 = 5'b00000; b5 = 5'b00000;
            #50 a5 = 5'b00000; b5 = 5'b00001;
            #50 a5 = 5'b00001; b5 = 3'b00000;
            #50 a5 = 5'b11111; b5 = 5'b11111;
       end
endmodule
