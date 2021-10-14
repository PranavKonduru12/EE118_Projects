`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 10:20:27 PM
// Design Name: 
// Module Name: comparator4bit_tb
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

//Name: Pranav Konduru
//ID: 013162916
module comparator4bit_tb();

reg [4:0] a4,b4;
wire g4, e4, l4;

comparator4bit c1 (.a4(a4), .b4(b4), .g4(g4), .l4(l4), .e4(e4));

initial begin

#50 a4 = 4'b0000; b4 = 4'b0000;
#50 a4 = 4'b1100; b4 = 4'b0101;
#50 a4 = 4'b0000; b4 = 4'b1000;
#50 a4 = 4'b1111; b4 = 4'b1111;
#50 a4 = 4'b0110; b4 = 4'b0100;

end

endmodule
