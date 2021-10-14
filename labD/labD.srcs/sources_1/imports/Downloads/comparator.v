//Name: Pranav Konduru
//ID: 013162916
module comparator(
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
