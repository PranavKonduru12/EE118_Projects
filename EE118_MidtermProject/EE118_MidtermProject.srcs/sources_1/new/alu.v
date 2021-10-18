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
    
    wire g1, e1, l1; 
    
    //instantiation twice
    comparator_2bit comp1(.a(a3[2:0]), .b(b3[2:0]), .g(g1), .e(e1), .l(l1));
    //comparator_2bit comp2(.a(a4[2:1]), .b(b4[2:1]), .g(g2), .e(e2), .l(l2));
    
    always @(*) begin
        // for g3
        if (a3[0] > b3[0]) begin
            g3 = 1;
            l3 = 0;
            e3 = 0;
        end
        //for l3
        else if (a3[0] < b3[0]) begin
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

//full
