module and2(input wire i1,i2,output wire o);
assign o = i1&i2;
endmodule

module or2(input wire i1,i2,output wire o);
assign o = i1|i2;
endmodule

module tfr(input wire clk,reset,t,output reg q);

always@(posedge clk)
begin
  case({reset,t})
    2'b00 :q=q;
    2'b01 :q=~q;
    default: q=0;
  endcase
end
endmodule

module up_down_counter(input wire clk,up,reset,output wire [2:0]out);
wire[2:0] q;
wire t1,t2,t3,t4,i1,i2;
tfr tf1(clk,reset, 1'b1, q[0]);
and2 a1_1(q[0], up, t1);
and2 a1_2(!q[0], !up, t2);
or2 o1(t1, t2, i1);
tfr tf2(clk,reset, i1, q[1]);
and2 a2_1(q[1], t1, t3);
and2 a2_2(!q[1], t2, t4);
or2 o2(t3, t4, i2);
tfr tf3(clk,reset, i2, q[2]);
assign out = q;
endmodule 

