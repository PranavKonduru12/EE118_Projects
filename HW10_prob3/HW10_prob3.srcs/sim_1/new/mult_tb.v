`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 11:16:10 PM
// Design Name: 
// Module Name: mult_tb
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

module smult4x4_tb(); 
    reg             clk; 
    reg             St; 
    reg     [3:0]   Mplier; 
    reg     [3:0]   Mcand; 
    wire    [8:0]   Prod; //added 
    wire            done; 
     
    mult4x4 DUT (.clk    (clk    ), 
                .St     (St     ), 
                .Mplier (Mplier ), 
                .Mcand  (Mcand  ), 
                .Prod   (Prod   ), 
                .done   (done   ) 
               ); 
                
    always #5   clk = ~clk; 
     
    initial 
    begin 
            clk     <= 1; 
            St      <= 0; 
            Mplier  <= 4'b1111; 
            Mcand   <= 4'b1111; 
        #10 St      <= 1; 
        #10 St      <= 0;         
    end    
endmodule
