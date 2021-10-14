//Pranav Konduru
//ID: 013162916
`timescale 1ns / 1ps


module testbench_4(

    );
    reg [3:0] a,b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;
    fulladder4bit dut(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));
    initial begin
    #10
    a=4'b0000;b=4'b0110;c_in=1;
    #50
    a=4'b0011;b=4'b1111;c_in=1;
    #50
    a=4'b1010;b=4'b0101;c_in=0;
    end
    
endmodule
