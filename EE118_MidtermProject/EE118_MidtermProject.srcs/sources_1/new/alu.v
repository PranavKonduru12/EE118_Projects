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
//Name: Pranav Konduru
//ID: 013162916
//4-bit ALU
module alu_4b(          //assinged inputs to the module
    input [2:0] a, b,   //will take in the 2 3-bit input values     
    input [1:0] s,      //input used to change the mode/opearation   
    input [2:0] vin,    //vertical cin for multiplier
    input hin,          //horizontal cin for multiplier
    output reg [15:0] r);    //assinged outputs
    
    //wires that connect the output instances to the alu output
    wire g3,e3,l3;          //wire that connect each of the comparator instances to the alu outputs
    wire [2:0] sum;         //wire that connect the sum of the fulladder instance to the alu outputs
    wire cout;              //wire that connects the cout of the fulladder instance to the alu outputs
    wire a_even, b_even;    //wire that connects the outputs of the odd-even instance to the alu ouput
    wire [5:0] p;           //wire that connects the outputs of the array multiplier instance to the alu output
    
    //These instances will call their designated modules and perform the operations 
    //with the inputs from the alu module. The outputs connect to wires, which are connected to the output.(addition, multiplication...)
    comparator_3bit al0(.a3(a), .b3(b),.g3(g3), .e3(e3), .l3(l3));      //3-bit comparator instance
    adder_3bit al1(.a3(a), .b3(b), .cin(s),.sum(sum), .cout(cout));     //3-bit full adder instance
    odd_even al2(.a(a), .b(b),.a_even(a_even), .b_even(b_even));        //odd-even instance
    multiplier_3bit al3(.a3(a), .b3(b), .vcin3(vin), .hcin3(hin),.p(p));    //3x3 array multiplier instance
    
    always @(a or b or s)
    case (s) //Displays all the possibilities of s (the mode/operation selector)
             //Each case of s has one of the math operator/module assigned   
        2'b00: begin    //3-bit comparator case for when s[2:0] is 00
            r[0]=g3;
            r[1]=l3;
            r[2]=e3;
            r[15:3] = 0;
        end
        
        2'b01: begin    //3-bit full adder case for when s[2:0] is 01
            r[2:0] = 0;
            r[3] = sum[0];
            r[4] = sum[1];
            r[5] = sum[2];
            r[6] = cout;
            r[15:7]=8'd0;
        end
        
        2'b10: begin    // 3-bit odd-even case for when s[2:0] is 10
            r[6:0] = 0;
            r[7] = a_even;
            r[8] = b_even;
            r[15:9]=7'd0;
            // r[8:7] = {b_even,a_even};
        end
        
        2'b11: begin    //3 x 3 array multiplier case for when s[2:0] is 11
           r[8:0]=9'd0;
           r[14:9] = p;
           r[15] = 0;
       end
    endcase
endmodule

//Name: Pranav Konduru
//ID: 013162916
//2-bit comparator that will be used as a building block to make the 3-bit comparator
module comparator_2bit(     //assigned input 
    input [1:0] a, b,      //takes in two values that each have 2-bit
    output reg g, e, l     //assigned outputs 
    );                     
    always @(*) begin     //case statements for all the possibilites of the input
        if (a > b) begin    //g = 1 if all possibilties of a > b
        g = 1;
        l = 0;
        e = 0;
        end
        
        else if (a < b) begin //l = 1 if all possibilties of a < b
        g = 0;
        l = 1;
        e = 0;
        end
        
        else begin          //if a and b do not follow any of the cases above, then e = 1
        g = 0;
        l = 0;
        e = 1;
        end    
    end
endmodule

//Name: Pranav Konduru
//ID: 013162916
//3-bit comparator
module comparator_3bit( //assigned inputs
    input [2:0] a3, b3, //two 3-bit inputs 
    output reg g3, e3, l3 //assigned outputs
    );
    
    wire g1, e1, l1, g2, e2, l2;  //wires that connect the 2-bit comparators and gates to the outputs of the module
    
    //instantiation twice for two 2-bit comparator
    comparator_2bit comp1(.a(a3[1:0]), .b(b3[1:0]), .g(g1), .e(e1), .l(l1)); 
    comparator_2bit comp2(.a(a3[2:1]), .b(b3[2:1]), .g(g2), .e(e2), .l(l2));
   
    always @(*) begin           //case statements for the third (most significant bit) bit
        if (a3[2] > b3[2] | ((a3[2] == b3[2]) & g1)) begin     //g3 = 1 either when the msb of a is greater than b
            g3 = 1;                                            //or both msbs are the same with g1 = 1 (first 2-bit)
            l3 = 0;                                            
            e3 = 0;
        end
        //for l3
        else if (a3[2] < b3[2] | ((a3[2] == b3[2]) & l1)) begin //l3 = 1 either when the msb of a is less than            
            g3 = 0;                                             //or both msbs are the same with l1 = 1 (first 2-bit)
            l3 = 1;                                             
            e3 = 0;
        end
        //for e3
        else begin              //if msb of a and b are not < or >, then e = 1
            g3 = 0;
            l3 = 0;
            e3 = 1;
        end
    end
endmodule

//Name: Pranav Konduru
//ID: 013162916
//1-bit full adder that will be used as a building block to make a 3-bit full adder
module adder_1bit(      //assinged inputs
    input a, b, cin,    
    output sum, cout    //assigned outputs
    );
    //wire s1, c1, c2;
    assign cout = (a & b) | (b & cin) | (cin & a); //assinged cout to the inputs using gates
    assign sum = a^b^cin;                          //assinged sum to the inputs using gates 
endmodule

//Name: Pranav Konduru
//ID: 013162916
//3-bit full adder
module adder_3bit(       //assigned inputs       
    input [2:0] a3, b3,  //two 3-bit inputs
    input cin,          //variable for cin
    output [2:0] sum,   //three-bit sum
    output cout         //variable for cout
    );
    wire c2, c1;        //w ires that connect one instance of the one-bit full adder to the next one between
                        //first and last one-bit full adder block(instance)
    //three instances of one-bit full adder
    adder_1bit fa0 (.a(a3[0]), .b(b3[0]), .cin(cin), .sum(sum[0]), .cout(c1)); //first one-bit full adder
    adder_1bit fa1 (.a(a3[1]), .b(b3[1]), .cin(c1), .sum(sum[1]), .cout(c2)); //second one-bit full adder 
    adder_1bit fa2 (.a(a3[2]), .b(b3[2]), .cin(c2), .sum(sum[2]), .cout(cout)); //third one-bit full adder   
endmodule

//Name: Pranav Konduru
//ID: 013162916
//Odd-Even Module
module odd_even(                    //assigned inputs
    input [2:0] a, b,               //two 3-bit numbers will be taken in as input
    output reg  a_even, b_even      //assigned outputs
    );
    
     always @(*) begin          //case statedemts to determine whether a or b is even by checking the lsb 
        if (a[0] == 1) begin    //if the least significant bit of a is 1, then a_even will be 0
            a_even = 0;
        end
        
        else begin              //if the statement above is not true, then a_even will be 1
            a_even=1;
        end
                
        if (b[0] == 1) begin    //Repeat of the process above but for the lsb of b
            b_even = 0;
        end
        
        else begin
            b_even=1;
        end        
        
     end 
endmodule

//Name: Pranav Konduru
//ID: 013162916
//1-bit array multiplier block (1 x 1 array multiplier block) will be used as building block for 3 x 3 array multiplier
module mult_adder_1bit(     //assigned inputs
    input a, b, vcin, hcin, 
    output vcout, hcout   
    );                  //assigned outputs
    wire x;         //wire that conneccts the a & b to the full adder
    assign x = a & b;
    assign vcout = x | vcin | hcin;
    assign hcout = (x & vcin) | (x & hcin) |(vcin & hcin);
endmodule

//Name: Pranav Konduru
//ID: 013162916
//3 x 3 array multiplier
module multiplier_3bit(         //assinged inputs
    input [2:0] a3, b3, vcin3,  //three 3-bit inputs
    input hcin3,                //horizontal cin will be 1-bit as it is the cin from full adder
    output [5:0] p              //product of the 3 x 3 array multiplier will have 6-bits
    );                          //assigned outputs
    
    wire [8:0] vcin, vcout, hcout;  //wires that connect all the 1-bit 1 x 1 array multiplier blocks
                                    //with each other and each of the ends are connected to the input and outputs 
                                    //the module   
    // first row consisting of 3 instances of the 1-bit array multiplier block connected togetherer with the wires above
    mult_adder_1bit a00 (.a(a3[0]), .b(b3[0]), .vcin(vcin3[0]), .hcin(hcin3), .hcout(hcout[0]), .vcout(p[0]));
    mult_adder_1bit a01 (.a(a3[1]), .b(b3[0]), .vcin(vcin3[1]), .hcin(hcout[0]), .hcout(hcout[1]), .vcout(vcout[0]));
    mult_adder_1bit a02 (.a(a3[2]), .b(b3[0]), .vcin(vcin3[2]), .hcin(hcout[1]), .hcout(hcout[2]), .vcout(vcout[1]));
    
    // second row consisting of 3 instances of the 1-bit array multiplier block connected togetherer with the wires above
    mult_adder_1bit a10 (.a(a3[0]), .b(b3[1]), .vcin(vcout[0]), .hcin(hcin3), .hcout(hcout[3]), .vcout(p[1]));
    mult_adder_1bit a11 (.a(a3[1]), .b(b3[1]), .vcin(vcout[1]), .hcin(hcout[3]), .hcout(hcout[4]), .vcout(vcout[3]));
    mult_adder_1bit a12 (.a(a3[2]), .b(b3[1]), .vcin(hcout[2]), .hcin(hcout[4]), .hcout(hcout[5]), .vcout(vcout[4]));
    
    // third row consisting of 3 instances of the 1-bit array multiplier block connected togetherer with the wires above
    mult_adder_1bit a20 (.a(a3[0]), .b(b3[2]), .vcin(vcout[3]), .hcin(hcin3), .hcout(hcout[6]), .vcout(p[2]));
    mult_adder_1bit a21 (.a(a3[1]), .b(b3[2]), .vcin(vcout[4]), .hcin(hcout[6]), .hcout(hcout[7]), .vcout(p[3]));
    mult_adder_1bit a22 (.a(a3[2]), .b(b3[2]), .vcin(hcout[5]), .hcin(hcout[7]), .hcout(p[4]), .vcout(p[5]));
    
endmodule

