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
module LabG_part1(input mclk, input [1:0] SW, output reg led0); 
     
    reg [32:0] counter; 
    always@(posedge mclk) 
    begin 
    counter <= counter +1; 
    case(SW) 
    2'b00: led0 <= counter[28]; 
    2'b01:led0 <= counter[26]; 
    2'b10:led0 <= counter[24]; 
    2'b11: led0 <= counter[20]; 
    endcase 
    end 
    endmodule
    
