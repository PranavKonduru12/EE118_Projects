//Pranav Konduru
//ID: 013162916
module d_flip_flop ( din ,clk ,dout );
output reg dout ;
input din, clk ;

always @ (posedge clk)
begin
  dout <= din;
end
endmodule

module MS( din ,clk ,dout);
output dout ;
input din,clk ;
wire qm, qs, in_clk;
assign in_clk = ~clk ;

d_flip_flop u0 (.din(din), .clk(in_clk), .dout(qm));  
d_flip_flop u1 (.din(qm), .clk(clk), .dout(qs));

assign dout = qs;

endmodule
