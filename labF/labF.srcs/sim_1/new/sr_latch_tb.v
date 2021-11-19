`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 09:40:07 AM
// Design Name: 
// Module Name: sr_latch_tb
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
module sr_latch_tb();
    reg r, s, clk;
    wire q;
    
    latch_sr t1(.R(r), .S(s), .Clk(clk), .Q_sr(q));
    
    always # 50 clk = ~clk;
    
    initial
        begin clk = 0;
            #50 s = 1'b0; r = 1'b0; 
            #50 s = 1'b1; r = 1'b0;
            #50 s = 1'b0; r = 1'b1;
            #50 s = 1'b1; r = 1'b1;
        end
        
endmodule
