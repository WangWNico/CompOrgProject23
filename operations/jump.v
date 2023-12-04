// PC <- X Jumps to address X
module jump (
  input clk,
  input rst,

  input wire [15:0] x,
  output reg [31:0] PC
);
  always @(posedge clk or posedge rst) begin
    if (rst) begin 
      PC <= 32'b0;
    end else begin
      PC <= X;
    end
  end

endmodule