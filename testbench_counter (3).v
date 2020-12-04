
`timescale 1ns/100ps

module updowncounter_testbench;
reg i, clk, reset, up;
wire[0:1] q1, q2;
wire[2:0] out;

up_down_counter dut(.clk(clk), .reset(reset), .up(up), .out(out));

initial begin
  $dumpfile("out.vcd");
  $dumpvars(0,updowncounter_testbench);
end

initial clk=1'b0; always #5 clk=~clk;

initial begin
  reset = 1;
  up = 1;
  #10;
  reset = 0;
  #10;
  up = 1;
  #60 
  up=0;
  #70
  reset=1;
  #20
   up=1;
   #10 $finish;
end
endmodule
