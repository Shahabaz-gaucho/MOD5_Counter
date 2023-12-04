module mod5cntr (input clk,input rst, output reg [2:0] count);
always @(posedge clk) begin
    if (rst) begin
      count <= 3'b000;
    end 
    else begin
      if (count == 3'b100) begin
        count <= 3'b000;
      end 
      else begin
        count <= count + 1;
      end
    end
  end

endmodule

module mod5cntr_tb;
reg clk,rst;
wire [2:0] count;
mod5cntr dut(.clk(clk),.rst(rst),.count(count));
initial 
   begin
    clk=1'b0;
    forever #5 clk=~clk; 
   end
   
initial 
   begin
    #10 rst=1;
    #20 rst=0;
    #100 $stop;
   end
endmodule