`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 09:51:49 AM
// Design Name: 
// Module Name: ms_d_flipflop
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


module ms_d_flipflop(
    input D, Clk,
    output Q_ms
    );
    wire q_m, q_s;
    assign Clk_inv = ~Clk
    latch_d m (.D(D), .Clk(Clk_inv), .Q_d(q_m));
    latch_d s (.D(q_m), .Clk(Clk), .Q_d(q_s));
    
    assign Q_ms = q_s;
endmodule
