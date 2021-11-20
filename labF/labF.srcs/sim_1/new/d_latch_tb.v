`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 11:11:08 AM
// Design Name: 
// Module Name: d_latch_tb
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

//Pranav Konduru
//ID: 013162916
module d_latch_tb();
    
    reg d, clk;
    wire q;
    
    latch_d t2(.D(d), .Clk(clk), .Q_d(q));
    
    always # 50 clk = ~clk;
    
    initial
        begin clk = 0;
            #50 d = 1'b0;  
            #50 d = 1'b1; 
            #50 d = 1'b0; 
            #50 d = 1'b1; 
        end
endmodule
