`timescale 1ns / 1ps


//Pranav Konduru
//ID: 013162916
module mut(a,m,u,t);
input [3:0] a;
output reg m,u,t;
always@(*)
begin
//for majority
case(a)
4'b0000: {m,u,t}=3'b010;
4'b0001: {m,u,t}=3'b000;
4'b0010: {m,u,t}=3'b000;
4'b0011: {m,u,t}=3'b001;
4'b0100: {m,u,t}=3'b000;
4'b0101: {m,u,t}=3'b001;
4'b0110: {m,u,t}=3'b001;
4'b0111: {m,u,t}=3'b100;
4'b1000: {m,u,t}=3'b000;
4'b1001: {m,u,t}=3'b001;
4'b1010: {m,u,t}=3'b001;
4'b1011: {m,u,t}=3'b100;
4'b1100: {m,u,t}=3'b001;
4'b1101: {m,u,t}=3'b100;
4'b1110: {m,u,t}=3'b100;
4'b1111: {m,u,t}=3'b110;
endcase
end
endmodule
