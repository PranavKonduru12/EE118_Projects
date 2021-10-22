`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 03:15:00 AM
// Design Name: 
// Module Name: alu
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

//4-bit ALU
module alu_4b(
    input [2:0] a, b, //assinged inputs to the module
    input [1:0] s,
    input [2:0] vin,
    input hin,
    output reg [15:0] r); //assinged outputs
    //Wires that connect 
    wire g3,e3,l3;
    wire [2:0] sum; 
    wire cout;
    wire a_even, b_even;
    wire [5:0] p;
    //Instances of all the modules were called here 
    comparator_3bit al0(.a3(a), .b3(b),.g3(g3), .e3(e3), .l3(l3));
     adder_3bit al1(.a3(a), .b3(b), .cin(s),.sum(sum), .cout(cout));
    odd_even al2(.a(a), .b(b),.a_even(a_even), .b_even(b_even));
     multiplier_3bit al3(.a3(a), .b3(b), .vcin3(vin), .hcin3(hin),.p(p));
    always @(a or b or s)
    case (s) //Each of these cases 
        2'b00: begin
            r[0]=g3;
            r[1]=l3;
            r[2]=e3;
            r[15:3] = 0;
        end
        
        2'b01: begin
            r[2:0] = 0;
            r[3] = sum[0];
            r[4] = sum[1];
            r[5] = sum[2];
            r[6] = cout;
            r[15:7]=8'd0;
        end
        
        2'b10: begin
            r[6:0] = 0;
            r[7] = a_even;
            r[8] = b_even;
            r[15:9]=7'd0;
            // r[8:7] = {b_even,a_even};
        end
        
        2'b11: begin
           r[8:0]=9'd0;
           r[14:9] = p;
           r[15] = 0;
       end
    endcase
endmodule

//2-bit comparator
module comparator_2bit(
    input [1:0] a, b,
    output reg g, e, l
    );
    always @(*) begin
        if (a > b) begin
        g = 1;
        l = 0;
        e = 0;
        end
        
        else if (a < b) begin
        g = 0;
        l = 1;
        e = 0;
        end
        
        else begin
        g = 0;
        l = 0;
        e = 1;
        end
        
    end
    //assign g = (a[1] & !b[1]) | (a[0] & !b[1] & !b[0]) | (a[1] & a[0] & b[0])
    //assign e = (!a[1] & !a[0] & !b[1] & !b[0]) | (!a[1] & a[0] & !b[1] & b[0]) | (a[1] & a[0] & b[1] & b[0]) | (a[1] & !a[0] & b[1] & !b[0])    
    //assign l = (!a[1] & b[1]) | (!a[1] & !a[0] & b[0]) | (!a[0] & b[1] & b[0]);
endmodule

module comparator_3bit(
    input [2:0] a3, b3,
    output reg g3, e3, l3
    );
    
    wire g1, e1, l1, g2, e2, l2; 
    
    //instantiation once for one 2-bit comparator
    comparator_2bit comp1(.a(a3[1:0]), .b(b3[1:0]), .g(g1), .e(e1), .l(l1));
    comparator_2bit comp2(.a(a3[2:1]), .b(b3[2:1]), .g(g2), .e(e2), .l(l2));
    //assign g2 = a3[2] & !b3[2];
    always @(*) begin
        if (a3[2] > b3[2] | ((a3[2] == b3[2]) & g1)) begin
            g3 = 1;
            l3 = 0;
            e3 = 0;
        end
        //for l3
        else if (a3[2] < b3[2] | ((a3[2] == b3[2]) & l1)) begin
            g3 = 0;
            l3 = 1;
            e3 = 0;
        end
        //for e3
        else begin
            g3 = 0;
            l3 = 0;
            e3 = 1;
        end
    end
endmodule

//1-bit full adder
module adder_1bit(
    input a, b, cin,
    output sum, cout
    );
    //wire s1, c1, c2;
    assign cout = (a & b) | (b & cin) | (cin & a);
    assign sum = a^b^cin;
endmodule

//3-bit full adder

module adder_3bit(
    input [2:0] a3, b3,
    input cin, 
    output [2:0] sum,
    output cout
    );
    wire c2, c1;
    
    adder_1bit fa0 (.a(a3[0]), .b(b3[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    adder_1bit fa1 (.a(a3[1]), .b(b3[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    adder_1bit fa2 (.a(a3[2]), .b(b3[2]), .cin(c2), .sum(sum[2]), .cout(cout));    
endmodule

//Check odd or even
module odd_even(
    input [2:0] a, b,
    output reg  a_even, b_even
    );
    
     always @(*) begin
        //if (a[0] == 0 & b[0] == 1) begin
        if (a[0] == 1) begin
            a_even = 0;
        end
        
        else begin
            a_even=1;
        end
                
        if (b[0] == 1) begin
            b_even = 0;
        end
        
        else begin
            b_even=1;
        end        
        
     end 
endmodule

//1-bit full adder for array multiplier
module mult_adder_1bit(
    input a, b, vcin, hcin,
    output vcout, hcout
    );
    wire x;
    assign x = a & b;
    assign vcout = x | vcin | hcin;
    assign hcout = (x & vcin) | (x & hcin) |(vcin & hcin);
endmodule

//3 x 3 array multiplier
module multiplier_3bit(
    input [2:0] a3, b3, vcin3,
    input hcin3,
    output [5:0] p
    );
    
    wire [8:0] vcin, vcout, hcout;
    
    // zerowth row 
    mult_adder_1bit a00 (.a(a3[0]), .b(b3[0]), .vcin(vcin3[0]), .hcin(hcin3), .hcout(hcout[0]), .vcout(p[0]));
    mult_adder_1bit a01 (.a(a3[1]), .b(b3[0]), .vcin(vcin3[1]), .hcin(hcout[0]), .hcout(hcout[1]), .vcout(vcout[0]));
    mult_adder_1bit a02 (.a(a3[2]), .b(b3[0]), .vcin(vcin3[2]), .hcin(hcout[1]), .hcout(hcout[2]), .vcout(vcout[1]));
    
    // first row
    mult_adder_1bit a10 (.a(a3[0]), .b(b3[1]), .vcin(vcout[0]), .hcin(hcin3), .hcout(hcout[3]), .vcout(p[1]));
    mult_adder_1bit a11 (.a(a3[1]), .b(b3[1]), .vcin(vcout[1]), .hcin(hcout[3]), .hcout(hcout[4]), .vcout(vcout[3]));
    mult_adder_1bit a12 (.a(a3[2]), .b(b3[1]), .vcin(hcout[2]), .hcin(hcout[4]), .hcout(hcout[5]), .vcout(vcout[4]));
    
    // second row
    mult_adder_1bit a20 (.a(a3[0]), .b(b3[2]), .vcin(vcout[3]), .hcin(hcin3), .hcout(hcout[6]), .vcout(p[2]));
    mult_adder_1bit a21 (.a(a3[1]), .b(b3[2]), .vcin(vcout[4]), .hcin(hcout[6]), .hcout(hcout[7]), .vcout(p[3]));
    mult_adder_1bit a22 (.a(a3[2]), .b(b3[2]), .vcin(hcout[5]), .hcin(hcout[7]), .hcout(p[4]), .vcout(p[5]));
    
endmodule

