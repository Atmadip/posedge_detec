module model (
  input clk,
  input resetn,
  input din,
  output dout
);
parameter reset = 0, state_1 = 1, state_2 = 2;
reg [1:0] state;
always @(posedge clk) begin
if(~resetn)
  state <= reset;
else begin
  case(state)
    reset : state <= (din ? state_1 : reset);
    state_1:state <= (din ? state_2 : reset);
    state_2:state <= (din ? state_2 : reset);
    default: state<= reset;
  endcase
end
end
assign dout = (state == state_1) ? 1:0;

endmodule