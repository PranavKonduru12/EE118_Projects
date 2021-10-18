`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 04:18:48 PM
// Design Name: 
// Module Name: amult
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
module adder (
    input a,b,vcin,hcin,
    output vcout,hcout
);

wire x;

assign x = a & b;
assign vcout = x ^ vcin ^ hcin;
assign hcout = ((x & vcin) + (x & hcin) + (vcin & hcin));

endmodule

module amult(
    input [3:0] a, b,
    input hin,
    input [3:0] vin,
    output [7:0] p
    );
    
    wire [15:0] vcin, vcout, hcout; 
 
    //zeroth bit of mutiplier 
    adder a00 (.a(a[0]), .b(b[0]), .vcin(vin[0]), .hcin(hin), .hcout(hcout[0]), .vcout(p[0]));
    adder a01 (.a(a[1]), .b(b[0]), .vcin(vin[1]), .hcin(hcout[0]), .hcout(hcout[1]), .vcout(vcout[0]));
    adder a02 (.a(a[2]), .b(b[0]), .vcin(vin[2]), .hcin(hcout[1]), .hcout(hcout[2]), .vcout(vcout[1]));
    adder a03 (.a(a[3]), .b(b[0]), .vcin(vin[3]), .hcin(hcout[2]), .hcout(hcout[3]), .vcout(vcout[2]));
    //1st bit of mutiplier
    adder a10 (.a(a[0]), .b(b[1]), .vcin(vcout[0]), .hcin(hin), .hcout(hcout[4]), .vcout(p[1]));
    adder a11 (.a(a[1]), .b(b[1]), .vcin(vcout[1]), .hcin(hcout[4]), .hcout(hcout[5]), .vcout(vcout[3]));
    adder a12 (.a(a[2]), .b(b[1]), .vcin(vcout[2]), .hcin(hcout[5]), .hcout(hcout[6]), .vcout(vcout[4]));
    adder a13 (.a(a[3]), .b(b[1]), .vcin(hcout[3]), .hcin(hcout[6]), .hcout(hcout[7]), .vcout(vcout[5]));
    //2nd bit of mutiplier
    adder a20 (.a(a[0]), .b(b[2]), .vcin(vcout[3]), .hcin(hin), .hcout(hcout[8]), .vcout(p[2]));
    adder a21 (.a(a[1]), .b(b[2]), .vcin(vcout[4]), .hcin(hcout[8]), .hcout(hcout[9]), .vcout(vcout[6]));
    adder a22 (.a(a[2]), .b(b[2]), .vcin(vcout[5]), .hcin(hcout[9]), .hcout(hcout[10]), .vcout(vcout[7]));
    adder a23 (.a(a[3]), .b(b[2]), .vcin(hcout[7]), .hcin(hcout[10]), .hcout(hcout[11]), .vcout(vcout[8]));
   //3rd bit of mutiplier
    adder a30 (.a(a[0]), .b(b[3]), .vcin(vcout[6]), .hcin(hin), .hcout(hcout[12]), .vcout(p[3]));
    adder a31 (.a(a[1]), .b(b[3]), .vcin(vcout[7]), .hcin(hcout[12]), .hcout(hcout[13]), .vcout(p[4]));
    adder a32 (.a(a[2]), .b(b[3]), .vcin(vcout[8]), .hcin(hcout[13]), .hcout(hcout[14]), .vcout(p[5]));
    adder a33 (.a(a[3]), .b(b[3]), .vcin(hcout[11]), .hcin(hcout[14]), .hcout(p[7]), .vcout(p[6]));

endmodule
