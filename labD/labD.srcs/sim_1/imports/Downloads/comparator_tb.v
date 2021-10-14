//Name: Pranav Konduru
//ID: 013162916
module comparator_tb();

reg [1:0] a,b;
wire g, e, l;

comparator c1 (.a(a), .b(b), .g(g), .l(l), .e(e));

initial begin

#50 a = 2'b00; b = 2'b00;
#50 a = 2'b00; b = 2'b01;
#50 a = 2'b00; b = 2'b10;
#50 a = 2'b00; b = 2'b11;
#50 a = 2'b01; b = 2'b00;
#50 a = 2'b01; b = 2'b01;
#50 a = 2'b01; b = 2'b10;
#50 a = 2'b01; b = 2'b11;
#50 a = 2'b10; b = 2'b00;
#50 a = 2'b10; b = 2'b01;
#50 a = 2'b10; b = 2'b10;
#50 a = 2'b10; b = 2'b11;
#50 a = 2'b11; b = 2'b00;
#50 a = 2'b11; b = 2'b01;
#50 a = 2'b11; b = 2'b10;
#50 a = 2'b11; b = 2'b11;


end

endmodule
