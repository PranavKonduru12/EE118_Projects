`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 03:48:52 PM
// Design Name: 
// Module Name: comparator_6bit
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


module two_bit_comp(a, b, g, e, l);
	input [1:0] a, b;
	output wire g, e, l;

    assign g = (a[1] & !b[1]) | (a[0] & !b[1] & !b[0]) | (a[1] & a[0] & !b[0]);
    assign e = (!a[1] & !a[0] & !b[1] & !b[0]) | (!a[1] & a[0] & !b[1] & b[0]) | (a[1] & a[0] & b[1] & b[0]) | (a[1] & !a[0] & b[1] & !b[0]);
    assign l = (!a[1] & b[1]) | (!a[1] & !a[0] & b[0]) | (!a[0] & b[1] & b[0]); 
	/*always @(*) begin
		if (a > b) begin
		g = 1;
		l = 0;
		e = 0;
		end

		else if (a < b) begin 
		l = 1;
		g = 0;
		e = 0;
		end

		else begin 
		l = 0;
		g = 0;
		e = 1;
		end
    end*/
endmodule

module six_bit_comp(a6, b6, g6, e6, l6);
	input [5:0] a6, b6;
	output g6, e6, l6;
	
	wire g1, e1, l1, g2, e2, l2, g3, e3, l3;

	two_bit_comp cp1(.a(a6[1:0]), .b(b6[1:0]), .g(g1), .e(e1), .l(l1));
	two_bit_comp cp2(.a(a6[3:2]), .b(b6[3:2]), .g(g2), .e(e2), .l(l2));
	two_bit_comp cp3(.a(a6[5:4]), .b(b6[5:4]), .g(g3), .e(e3), .l(l3));
    
    assign g6 = g3 | (g2 & e3) | (g1 & e3 & e2); 
    assign e6 = e3 & e2 & e1;
    assign l6 = l3 | (l2 & e3) | (l1 & e3 & e2);
	/*always @(*) begin

		if (a6[0] > b6[0]) begin
			g6 = 1;
			e6 = 0;
			l6 = 0;
		end

		else if (a6[0] < b6[0]) begin
			g6 = 0;
			l6 = 1;
			e6 = 0;
		end

		else begin
			g6 = 0;
			l6 = 0;
			e6 = 1;
		end
	end*/

endmodule


