`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 01:03:04 AM
// Design Name: 
// Module Name: fulladder_3bit_tb
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
module fulladder_3bit_tb();
    reg [2:0] a3, b3;
    reg cin;
    wire [2:0] sum;
    wire cout;
    
    adder_3bit t2 (.a3(a3), .b3(b3), .cin(cin), .sum(sum), .cout(cout));
    
    initial 
        begin
            /*#50 a3 = 3'b000; b3 = 3'b000; cin = 1;
            #50 a3 = 3'b101; b3 = 3'b011; cin = 1;
            #50 a3 = 3'b010; b3 = 3'b101; cin = 1;
            #50 a3 = 3'b111; b3 = 3'b111; cin = 1;*/
            #50 a3 = 3'b111; b3 = 3'b100; cin = 1;
            #50 a3 = 3'b001; b3 = 3'b100; cin = 1;
            #50 a3 = 3'b011; b3 = 3'b100; cin = 1;
            #50 a3 = 3'b111; b3 = 3'b111; cin = 1;
        end
endmodule
