`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 11:33:27 AM
// Design Name: 
// Module Name: alu_4b_tb
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

//Name: Pranav Konduru
//ID: 013162916
module alu_4b_tb();
    reg [2:0] a, b,vin;
    reg hin;
    reg [1:0] s;
    wire [15:0] r;
    
  
    alu_4b t5(.a(a), .b(b),.s(s),.r(r),.hin(hin),.vin(vin));
    
    initial
        begin
            #50 a = 3'b100; b = 3'b010; s =2'd0; 
            #50 a = 3'b100; b = 3'b001; s = 2'd0; 
            #50 a = 3'b010; b = 3'b100; hin=0;vin=3'b000; s = 2'd0; 
            #50 a = 3'b110; b = 3'b110; s = 2'd0;
        end 
endmodule
