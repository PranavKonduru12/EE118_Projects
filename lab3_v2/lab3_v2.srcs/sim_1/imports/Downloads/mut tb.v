`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 01:29:50 PM
// Design Name: 
// Module Name: muttb
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
module muttb(

    );
    reg [3:0] a;
    wire m,u,t;
    integer i;
    mut dut(.a(a),.m(m),.u(u),.t(t));
    
   initial begin 
    #10
    for(i=0;i<16;i=i+1)
    #50 a=i;
   end
endmodule
