//Pranav Konduru
//ID: 013162916
`timescale 1ns / 1ps


module fulltb();
    reg cin,a,b;
    wire s,cout;
    fulladder dut(.cin(cin),.a(a),.b(b),.s(s),.cout(cout));
    initial begin
    #10
    a=0;b=0;cin=0;
    #50
     a=0;b=0;cin=1;
    #50
     a=0;b=1;cin=0;
    #50;
     a=0;b=1;cin=1;
    #50;
     a=1;b=0;cin=0;
    #50;
     a=1;b=0;cin=1;
    #50;
     a=1;b=1;cin=0;
    #50;
     a=1;b=1;cin=1;
    #50;
    end    
endmodule
