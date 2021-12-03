`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 11:08:03 PM
// Design Name: 
// Module Name: fourbit_sequential_mult
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

module mult4x4 (clk,St,Mplier,Mcand,Prod,done); 
input clk; 
input St; 
input [3:0] Mplier; 
input [3:0] Mcand; 
output [8:0] Prod; //added 
output done; 
reg done; 
reg [3:0] pstate, nstate; 
reg [8:0] Prod; 
parameter s0=4'b0000, s1=4'b0001, s2=4'b0010, s3=4'b0011; 
parameter s4=4'b0100, s5=4'b0101, s6=4'b0110, s7=4'b0111; 
parameter s8=4'b1000, s9=4'b1001; 
reg [8:0] ACC; //accumulator 
//reg M = ACC[0]; //M is bit 0 of ACC; could use 'define 
wire M; 
assign M = ACC[0]; 
always @(posedge clk or posedge St) 
if (St) pstate = s0; 
else pstate = nstate; 
always @(pstate) //state transition 
case (pstate) 
s0: if(St) nstate = s1; 
s1: if(M) nstate = s2; else nstate = s3; 
s2: nstate = s3; 
s3: if(M) nstate = s4; else nstate = s5; 
s4: nstate = s5; 
s5: if(M) nstate = s6; else nstate = s7; 
s6: nstate = s7; 
s7: if(M) nstate = s8; else nstate = s9; 
s8: nstate = s9; 
s9: nstate = s0; 
endcase 
always @(pstate) //Output (Action) 
case (pstate) 
s0: begin 
ACC[8:4] = 5'b00000; 
ACC[3:0] = Mplier; 
end 
s1: ACC[8:4] = {1'b0, ACC[7:4]} + {1'b0, Mcand}; 
s2: ACC = {1'b0, ACC[8:1]}; 
s3: if(M) ACC[8:4] = {1'b0, ACC[7:4]} + {1'b0, Mcand}; else ACC = {1'b0, ACC[8:1]};  
s4: ACC = {1'b0, ACC[8:1]}; 
s5: if(M) ACC[8:4] = {1'b0, ACC[7:4]} + {1'b0, Mcand}; else ACC = {1'b0, ACC[8:1]}; 
s6: ACC = {1'b0, ACC[8:1]}; 
s7: if(M) ACC[8:4] = {1'b0, ACC[7:4]} + {1'b0, Mcand}; else ACC = {1'b0, ACC[8:1]}; 
s8: ACC = {1'b0, ACC[8:1]}; 
s9: begin 
done = 1'b1; 
Prod = ACC; 
end 
endcase 
endmodule
