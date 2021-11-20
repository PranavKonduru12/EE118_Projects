`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:07:14 AM
// Design Name: 
// Module Name: ms_flipflop_tb
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
module ms_flipflop_tb();
    reg D, clk;
    wire Q_ms;
    
    ms_d_flipflop t1 (.D(D), .Clk(clk), .Q_ms(Q_ms));
    
    always # 50 clk = ~clk;
    
    initial 
        begin
            clk = 0;
clk=0;
#12 D=1;
#10 D=0;
#5 D=0;
#11 D=1;
#1 D=1;
#22 D=0;
#12 D=1;
#10 D=0;
#5 D=0;
#11 D=1;
#1 D=1;
#22 D=0;
end
endmodule
