`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 05:29:17 PM
// Design Name: 
// Module Name: amult_tb
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


module amult_tb();

reg [3:0] a,b;
reg hin;
reg [3:0] vin;
wire [7:0] p;

amult m1 (.a(a), .b(b), .p(p), .hin(hin), .vin(vin));

initial begin
#50 a = 4'b0000; b = 4'b0000; hin = 0; vin = 0;
#50 a = 4'b1010; b = 4'b1011; hin = 0; vin = 0;
#50 a = 4'b0110; b = 4'b1000; hin = 0; vin = 0;
#50 a = 4'b1111; b = 4'b1111; hin = 0; vin = 0;
end


endmodule
