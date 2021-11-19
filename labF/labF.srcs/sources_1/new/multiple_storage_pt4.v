`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:23:37 AM
// Design Name: 
// Module Name: multiple_storage
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

module Positiveedge( D, Clk, Qb);
input D, Clk;
output reg Qb;
always @ (posedge Clk)
begin
Qb <= D;
end
endmodule


module Negativeedge( D, Clk, Qc);
input D, Clk;
output reg Qc;
always @ (negedge Clk)
begin
Qc <= D;
end
endmodule

module multiple_storage(
    input D, Clk,
    output Qa, Qb, Qc
    );
    
    latch_d latch1(.D(D), .Clk(Clk), .Q_d(Qa));
    Positiveedge F42(.Clk(Clk),.D(D),.Qb(Qb));
    Negativeedge F43(.Clk(Clk),.D(D),.Qc(Qc));
endmodule

