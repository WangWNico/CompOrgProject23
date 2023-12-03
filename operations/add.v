module Add (
  input [3:0] X,
  input [3:0] AC_in,
  input clk,
  input rst,
  input c_in,
  output reg c_out,
  output reg [3:0] AC_out
);

always @(posedge clk or posedge rst) begin
  if (rst) begin
    c_out <= 1'b0;
    AC_out <= 4'b0;
  end else begin
    {c_out, AC_out} <= X + AC_in + c_in;
  end
end

endmodule
