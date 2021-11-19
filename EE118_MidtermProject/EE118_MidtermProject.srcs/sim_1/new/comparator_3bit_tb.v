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

//Name: Pranav Konduru
//ID: 013162916
module comparator_3it_tb();
    reg [2:0] a3, b3;
    wire g3, e3, l3;
    
    comparator_3bit t1 (.a3(a3), .b3(b3), .g3(g3), .e3(e3), .l3(l3));
    
    initial 
        begin
            #50 a3 = 3'b000; b3 = 3'b000;
            #50 a3 = 3'b000; b3 = 3'b001;
            #50 a3 = 3'b001; b3 = 3'b000;
            #50 a3 = 3'b111; b3 = 3'b111;
        end
endmodule
