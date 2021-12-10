`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2021 06:47:22 PM
// Design Name: 
// Module Name: labh
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
/*
module LED_BCD8x7seg(clk, ca, cb, cc, cd, ce, cf, cg, dp, an);
input clk;
output ca, cb, cc, cd, ce, cf, cg, dp;
output [7:0] an;
reg [21:0] cnt;
always @(posedge clk) cnt<=cnt+22'h1;
wire cntovf = &cnt; 
// 8 BCD digits
wire [8*4-1:0] BCD_digits;
BCD8 BCD(.clk(clk), .ena(cntovf), .BCD_digits(BCD_digits)); // BCD8 is defined below
// multiplexer
reg [3:0] BCDdigit;

// anode driver
wire [2:0] digitScan = cnt[10:8];
assign an[0] = ~(digitScan==3'h0);
assign an[1] = ~(digitScan==3'h1);
assign an[2] = ~(digitScan==3'h2);
assign an[3] = ~(digitScan==3'h3);
assign an[4] = ~(digitScan==3'h4);
assign an[5] = ~(digitScan==3'h5);
assign an[6] = ~(digitScan==3'h6);
assign an[7] = ~(digitScan==3'h7);


always @(*)
case(digitScan)
 3'd0: BCDdigit = BCD_digits[ 3: 0];
 3'd1: BCDdigit = BCD_digits[ 7: 4];
 3'd2: BCDdigit = BCD_digits[11: 8];
 3'd3: BCDdigit = BCD_digits[15:12];
 3'd4: BCDdigit = BCD_digits[19:16];
 3'd5: BCDdigit = BCD_digits[23:20];
 3'd6: BCDdigit = BCD_digits[27:24];
 3'd7: BCDdigit = BCD_digits[31:28];
endcase
// 7-segments decoder
reg [7:0] SevenSeg;
always @(*)
case(BCDdigit)
 4'h0: SevenSeg = 8'b11111100;
 4'h1: SevenSeg = 8'b01100000;
 4'h2: SevenSeg = 8'b11011010;
 4'h3: SevenSeg = 8'b11110010;
 4'h4: SevenSeg = 8'b01100110;
 4'h5: SevenSeg = 8'b10110110;
 4'h6: SevenSeg = 8'b10111110;
 4'h7: SevenSeg = 8'b11100000;
 4'h8: SevenSeg = 8'b11111110;
 4'h9: SevenSeg = 8'b11110110;
 default: SevenSeg = 8'b00000000;
endcase
assign {ca, cb, cc, cd, ce, cf, cg, dp} = ~SevenSeg;
endmodule 

module BCD8(clk, ena, BCD_digits);
input clk, ena;
output [8*4-1:0] BCD_digits;
wire [7:0] carryout;
assign carryout[0] = ena;
BCD1 digit0(.clk(clk), .ena(carryout[0]), .BCD_digit(BCD_digits[ 3: 0]), .BCD_carryout(carryout[1]));
BCD1 digit1(.clk(clk), .ena(carryout[1]), .BCD_digit(BCD_digits[ 7: 4]), .BCD_carryout(carryout[2]));
BCD1 digit2(.clk(clk), .ena(carryout[2]), .BCD_digit(BCD_digits[11: 8]), .BCD_carryout(carryout[3]));
BCD1 digit3(.clk(clk), .ena(carryout[3]), .BCD_digit(BCD_digits[15:12]), .BCD_carryout(carryout[4]));
BCD1 digit4(.clk(clk), .ena(carryout[4]), .BCD_digit(BCD_digits[19:16]), .BCD_carryout(carryout[5]));
BCD1 digit5(.clk(clk), .ena(carryout[5]), .BCD_digit(BCD_digits[23:20]), .BCD_carryout(carryout[6]));
BCD1 digit6(.clk(clk), .ena(carryout[6]), .BCD_digit(BCD_digits[27:24]), .BCD_carryout(carryout[7]));
BCD1 digit7(.clk(clk), .ena(carryout[7]), .BCD_digit(BCD_digits[31:28]));
endmodule
module BCD1(clk, ena, BCD_digit, BCD_carryout);
input clk, ena;
output [3:0] BCD_digit;
output BCD_carryout;
reg [3:0] BCD_digit;
wire BCDrollover = (BCD_digit==4'd9);
always @(posedge clk)
if(ena)
begin
 if(BCDrollover) BCD_digit<=4'd0; else BCD_digit<=BCD_digit+4'd1;
end
assign BCD_carryout = ena & BCDrollover;
endmodule 
*/

//Pranav Konduru
//ID: 013162916
module textScrolling(
    input clock,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp,
    output [7:0] an
    );

reg [28:0] ticker; //to hold a count of 50M
wire click;
reg [7:0] eighth, seventh, sixth, fifth, fourth, third, second, first; // registers to hold the LED values

always @ (posedge clock or posedge reset) //always block for the ticker
begin
 if(reset)
  ticker <= 0;
 else if(ticker == 50000000) //reset after 1 second
  ticker <= 0;
 else
  ticker <= ticker + 1;
end

reg [3:0] clickcount; //register to hold the count upto 9. That is why a 4 bit register is used. 3 bit would not have been enough.

assign click = ((ticker == 50000000)?1'b1:1'b0); //click every second

always @ (posedge click or posedge reset)
begin
 if(reset)
  clickcount <= 0;
 else if(clickcount == 8)
   clickcount <= 0;
  else 
  clickcount <= clickcount + 1;

end

always @ (*) //always block that will scroll or move the text. Accomplished with case
begin
    case(clickcount)
    0:
    begin
     first = 2; //-
     second = 0; //O
     third = 7; //L
     fourth = 7; //L
     fifth = 3; //E
     sixth = 4; //H
     seventh = 2; //-
     eighth = 2; //-
    end

    1:
    begin
     first = 2; //-
     second = 2; //-
     third = 0; //O
     fourth = 7; //L
     fifth = 7; //L
     sixth = 3; //E
     seventh = 4; //H
     eighth = 2; //-
    end
    
    2:
    begin
     first = 2; //-
     second = 2; //-
     third = 2; //-
     fourth = 0; //O
     fifth = 7; //L
     sixth = 7; //L
     seventh = 3; //E
     eighth = 4; //H
    end
    
    3:
    begin
     first = 4; //H
     second = 2; //-
     third = 2; //-
     fourth = 2; //-
     fifth = 0; //O
     sixth = 7; //L
     seventh = 7; //L
     eighth = 3; //E
    end


    4:
    begin
     first = 3; //E
     second = 4; //H
     third = 2; //-
     fourth = 2; //-
     fifth = 2; //-
     sixth = 0; //O
     seventh = 7; //L
     eighth = 7; //L
    end
    
    5:
    begin
     first = 7; //L
     second = 3; //E
     third = 4; //H
     fourth = 2; //-
     fifth = 2; //-
     sixth = 2; //-
     seventh = 0; //O
     eighth = 7; //L
    end
    
    6:
    begin
     first = 7; //L
     second = 7; //L
     third = 3; //E
     fourth = 4; //H
     fifth = 2; //-
     sixth = 2; //-
     seventh = 2; //-
     eighth = 0; //O
    end
    
    7:
    begin
     first = 0; //O
     second = 7; //L
     third = 7; //L
     fourth = 3; //E
     fifth = 4; //H
     sixth = 2; //-
     seventh = 2; //-
     eighth = 2; //-
    end
    
  endcase
  
end

localparam N = 18;

reg [N-1:0]count;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0]sseg;
reg [7:0]an_temp;

always @ (*)
 begin
  case(count[N-1:N-3])
   
   3'b000 : 
    begin
     sseg = first;
     an_temp = 8'b11111110;
    end
   
   3'b001:
    begin
     sseg = second;
     an_temp = 8'b11111101;
    end
   
   3'b010:
    begin
     sseg = third;
     an_temp = 8'b11111011;
    end
    
   3'b011:
    begin
     sseg = fourth;
     an_temp = 8'b11110111;
    end

    3'b100: 
    begin
     sseg = fifth;
     an_temp = 8'b11101111;
    end
   
   3'b101:
    begin
     sseg = sixth;
     an_temp = 8'b11011111;
    end
   
   3'b110:
    begin
     sseg = seventh;
     an_temp = 8'b10111111;
    end
    
   3'b111:
    begin
     sseg = eighth;
     an_temp = 8'b01111111;
    end
  endcase
 end
assign an = an_temp;

reg [6:0] sseg_temp; 
always @ (*)
 begin
  case(sseg)
   4 : sseg_temp = 7'b0001001; //to display H
   3 : sseg_temp = 7'b0000110; //to display E
   7 : sseg_temp = 7'b1000111; //to display L
   0 : sseg_temp = 7'b1000000; //to display O   
   default : sseg_temp = 7'b1111111; //blank
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 
assign dp = 1'b1;

endmodule
