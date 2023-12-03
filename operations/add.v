module Add (
  input wire clk,
  input wire rst,

  input [15:0] X, // input address
  input [15:0] M[4096],
  output reg [15:0] AC
);

  reg MAR[15:0];
  reg MBR[15:0];

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      MAR <= 16'b0;
      MBR <= 16'b0;
    end else begin
      MAR <= X;
      MBR <= M[MAR];
      AC <= AC + MBR;
    end
  end

endmodule
