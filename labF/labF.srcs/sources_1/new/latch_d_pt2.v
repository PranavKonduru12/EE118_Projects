`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 10:44:20 AM
// Design Name: 
// Module Name: latch_d
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
module latch_d(
    input D, Clk,
    output Q_d
    );
    
    wire r_g, s_g, qa, qb, s, r;
    
    nand(s_g, D, Clk);
    nand(r_g, Clk, ~D);
    nand(qa, s_g, qb);
    nand(qb, r_g, qa);
    
    assign Q_d = qa;
endmodule
