`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:43:53 AM
// Design Name: 
// Module Name: multiple_storage_tb
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
module multiple_storage_tb();
    reg D, Clk;
    wire Qa, Qb, Qc;
    
    multiple_storage t2 (.D(D), .Clk(Clk), .Qa(Qa), .Qb(Qb), .Qc(Qc));
    
    always #10 Clk = ~Clk;
initial begin
Clk = 0;
#50  D=0;
#50 D=1;
#10 D=0;
#10 D=1;
#10 D=0;
#2 D=1;
#2 D=0;
#3 D=1;
#30 D=0;
#30 D=1;
#20 D=0;
#10 D=0;
#30 D=1;
#50  D=0;
#50 D=1;
#10 D=0;
#10 D=1;
#10 D=0;
#2 D=1;
#2 D=0;
#3 D=1;
#30 D=0;
#30 D=1;
#20 D=0;
#10 D=0;
#30 D=1;
#20 D=1;
end

endmodule
