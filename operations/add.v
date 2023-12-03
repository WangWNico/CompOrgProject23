module Add (
  input wire clk,
  input wire rst,
  
  input [15:0] X, // input address
  input [15:0] M[4096],
  input [15:0] AC_in,
  input c_in,
  output reg c_out,
  output reg [15:0] AC_out
);

always @(posedge clk or posedge rst) begin
  if (rst) begin
    c_out <= 1'b0;
    AC_out <= 16'b0;
  end else begin
    {c_out, AC_out} <= X + AC_in + c_in;
  end
end

endmodule
