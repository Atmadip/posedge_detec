module model (
  input clk,
  input resetn,
  input din,
  output dout
);

reg temp, temp_1;
always @(posedge clk)
begin
  if (~resetn)
    temp <= 0;
  else
    temp <= din;
end

always @(posedge clk)
begin
  if (~resetn)
    temp_1 <= 0;
  else
    temp_1 <= temp;
end

assign dout = (~temp_1) & temp;
endmodule
