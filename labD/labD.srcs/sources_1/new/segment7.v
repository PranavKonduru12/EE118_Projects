//Name: Pranav Konduru
//ID: 013162916
module segment7(

    input wire [3:0] bit,
    output reg [3:0] An,
    output reg [7:0] SSeg
     );
     

always @(*)
    begin
		
case(bit[3:0]) 
4'h0: SSeg[7:0] = 8'b10000001;
4'h1: SSeg[7:0] = 8'b11001111;
4'h2: SSeg[7:0] = 8'b10010010;
4'h3: SSeg[7:0] = 8'b10000110;
4'h4: SSeg[7:0] = 8'b11001100;
4'h5: SSeg[7:0] = 8'b10100100;
4'h6: SSeg[7:0] = 8'b10100000;
4'h7: SSeg[7:0] = 8'b10001111;
4'h8: SSeg[7:0] = 8'b10000000;
4'h9: SSeg[7:0] = 8'b10000100;
4'ha: SSeg[7:0] = 8'b10001000;
4'hb: SSeg[7:0] = 8'b11100000;
4'hc: SSeg[7:0] = 8'b10110001;
4'hd: SSeg[7:0] = 8'b11000010;
4'he: SSeg[7:0] = 8'b10110000;
default : SSeg[7:0] = 8'b10111000;
endcase
end
endmodule