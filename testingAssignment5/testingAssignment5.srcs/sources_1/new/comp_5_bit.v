`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 04:14:24 PM
// Design Name: 
// Module Name: comp_5_bit
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


module comp_5_bit(a5, b5, g5, e5, l5);
    input [4:0] a5, b5;
    output g5, e5, l5;
    
    wire g1, e1, l1, g2, e2, l2, g3, e3, l3;
    
    two_bit_comp cp4(.a(a5[1:0]), .b(b5[1:0]), .g(g1), .e(e1), .l(l1));
	two_bit_comp cp5(.a(a5[3:2]), .b(b5[3:2]), .g(g2), .e(e2), .l(l2));
	//two_bit_comp cp6(.a(a5[4]), .b(b5[4]), .g(g3), .e(e3), .l(l3));
	
	assign g3 = (a5[4] & !b5[4]);
	assign l3 = (!a5[4] & !b5[4]);
	assign e3 = (!a5[4] & !b5[4]) | (a5[4] & b5[4]);
	
	assign g5 = g3 | (g2 & e3) | (g1 & e3 & e2); 
    assign e5 = e3 & e2 & e1;
    assign l5 = l3 | (l2 & e3) | (l1 & e3 & e2);
	
	/*always @(*) begin

		if (a5[0] > b5[0]) begin
			g5 = 1;
			e5 = 0;
			l5 = 0;
		end

		else if (a5[0] < b5[0]) begin
			g5 = 0;
			l5 = 1;
			e5 = 0;
		end

		else begin
			g5 = 0;
			l5 = 0;
			e5 = 1;
		end
    end*/
    
endmodule
