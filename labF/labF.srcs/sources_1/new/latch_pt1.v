`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 09:29:13 AM
// Design Name: 
// Module Name: latch
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
module latch_sr(R, S, Clk, Q_sr);
    input R,S,Clk;
    output Q_sr;
    
    wire r_g, s_g, qa, qb;
    
    //Two initial AND gates with clocks
    /*and(r_g, R, Clk);
    and(s_g, S, Clk);
    nor(qa, r_g, qb);
    nor(qb, s_g, qa);*/
    
    assign r_g = R & Clk;
    assign s_g = S & Clk;
    assign qa = ~(r_g | qb);
    assign qb = ~(s_g | qa);
    
    assign Q_sr = qa;
    
endmodule
