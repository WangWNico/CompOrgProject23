module store (
  input wire clk,
  input wire rst,
  
  input wire [15:0] X,
  input wire [15:0] AC,
  output reg [15:0] M[4096] // memory
);
  reg [15:0] MAR; // memory address register
  reg [15:0] MBR; // memory buffer register

  always @(posedge clk or posedge rst) begin
    if (rst) begin 
      MAR <= 16'b0;
      MBR <= 16'b0;
    end else begin
      MAR <= X;
      MBR <= AC;
      M[MAR] <= MBR;
    end
  end

endmodule 