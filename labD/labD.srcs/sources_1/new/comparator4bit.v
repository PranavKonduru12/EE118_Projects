`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 10:19:49 PM
// Design Name: 
// Module Name: comparator4bit
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
module comparator_4bit(
    input [1:0] a,b,
    output reg g, e, l
    );
    
always @(*) begin    
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
    e = 1;
    g = 0;
    l = 0;
    end
   
    end
endmodule


module comparator4bit (
    input [3:0] a4,b4,
    output reg g4,l4,e4
    );
    
    wire gw1, ew1, lw1, gw2, ew2, lw2;
    
    comparator_4bit cp1(.a(a4[1:0]), .b(b4[1:0]), .g(gw1), .l(lw1), .e(ew1));
    comparator_4bit cp2(.a(a4[3:2]), .b(b4[3:2]), .g(gw2), .l(lw2), .e(ew2));
  
    always @(*) begin
        
        if (gw2 | (ew2 & gw1)) begin
            g4 = 1;
            l4 = 0;
            e4 = 0;
        end
        else if (lw2 | (ew2 & lw1)) begin
            g4 = 0;
            l4 = 1;
            e4 = 0;
        end
        else begin
            g4 = 0;
            l4 = 0;
            e4 = 1;
        end
    end
  
endmodule
    /*assign g4 = gw2 | (ew2 & gw1);
    assign l4 = lw2 | (ew2 & lw1);
    assign e4 = ew1 & ew2;

endmodule
*/
