`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2021 09:27:32 PM
// Design Name: 
// Module Name: array_mult_tb
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


module array_mult_tb();
    reg [2:0] a3, b3, vcin3;
    reg hcin3;
    wire [5:0] p;
    
    mult_3bit t3 (.a3(a3), .b3(b3), .vcin3(vcin3), .hcin3(hcin3), .p(p));
    
    initial
        begin
            #50 a3 = 3'b000; b3 = 3'b000; hcin3 = 0; vcin3 = 0;
            #50 a3 = 3'b101; b3 = 3'b011; hcin3 = 0; vcin3 = 0;
            #50 a3 = 3'b010; b3 = 3'b101; hcin3 = 0; vcin3 = 0;
            #50 a3 = 3'b111; b3 = 3'b111; hcin3 = 0; vcin3 = 0;
        end 
endmodule
