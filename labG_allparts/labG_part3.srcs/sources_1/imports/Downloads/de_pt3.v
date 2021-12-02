`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 12:38:42 PM
// Design Name: 
// Module Name: part1
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
module part3(
mclk,SW,an,ssg,sig);
input mclk;
input [1:0] sig;
input [3:0] SW;
output [7:0] an;
output [6:0] ssg;
reg [6:0] dig;
reg [32:0] clkdiv;
reg [3:0] cntr;
reg cclk;
always @(cntr)
begin
case (cntr)
4'b0000: dig=7'b0111111; //0
4'b0001: dig=7'b0000110; //1
4'b0010: dig=7'b1011011; //2
4'b0011: dig=7'b1001111; //3
4'b0100: dig=7'b1100110; //4
4'b0101: dig=7'b1101101; //5
4'b0110: dig=7'b1111101; //6
4'b0111: dig=7'b0000111; //7
4'b1000: dig=7'b1111111; //8
4'b1001: dig=7'b1101111; //9
4'b1010: dig=7'b1110111; // A
4'b1011: dig=7'b1111100; // B
4'b1100: dig=7'b1011000; // C
4'b1101: dig=7'b1011110; // D
4'b1110: dig=7'b1111001; // E
4'b1111: dig=7'b1110001; // F
default: dig=7'b0000000;
endcase
end
assign ssg=~dig;
assign an = {4'b1111, ~SW};


always @(posedge mclk)
begin
clkdiv <= clkdiv + 1;
end

always @(posedge clkdiv)
begin
case(sig)
2'b00: cclk = clkdiv[28]; //counters
2'b01: cclk = clkdiv[26];
2'b10: cclk = clkdiv[24]; 
2'b11: cclk = clkdiv[16];
endcase
end

always @(posedge cclk)
begin
cntr <= cntr + 1;
end
endmodule
