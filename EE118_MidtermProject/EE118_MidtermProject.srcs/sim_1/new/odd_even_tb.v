`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 02:07:12 AM
// Design Name: 
// Module Name: odd_even_tb
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


module odd_even_tb();
    reg [2:0] a, b;
    wire a_even, b_even;
    
     odd_even t4(
.a(a), .b(b), .a_even(a_even), .b_even(b_even)
); 
     
     initial 
        begin
            #50 a = 3'b001; b = 3'b000;
            #50 a = 3'b000; b = 3'b001;
        end
endmodule
