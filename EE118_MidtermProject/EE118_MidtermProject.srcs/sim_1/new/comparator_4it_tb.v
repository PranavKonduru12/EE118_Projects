`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 10:53:48 AM
// Design Name: 
// Module Name: comparator_4it_tb
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


module comparator_4it_tb();
    reg [2:0] a4, b4;
    wire g4, e4, l4;
    
    comparator_4bit t1 (.a4(a4), .b4(b4), .g4(g4), .e4(e4), .l4(l4));
    
    initial 
        begin
            #50 a4 = 3'b000; b4 = 3'b000;
            #50 a4 = 3'b000; b4 = 3'b001;
            #50 a4 = 3'b001; b4 = 3'b000;
            #50 a4 = 3'b111; b4 = 3'b111;
        end
endmodule
