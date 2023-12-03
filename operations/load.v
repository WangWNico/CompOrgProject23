module Load (
  input wire clk,
  input wire rst,

  input wire [15:0] X,      // Input data (address)
  input wire [15:0] M [4096], // Memory array (assuming 256 words of 8 bits each)
  output reg [15:0] AC       // Accumulator
);
  reg [15:0] MAR;   // Memory Address Register
  reg [15:0] MBR;   // Memory Buffer Register

  always @ (posedge clk or posedge rst) begin
    if (reset) begin
      // Reset values
      MAR <= 16'b0;
      MBR <= 16'b0;
      AC <= 16'b0;
    end else begin
      // Load X (address) into MAR
      MAR <= X;

      // Load value stored at address into MBR
      MBR <= M[MAR];

      // Load value in MBR into AC
      AC <= MBR;
    end
  end
endmodule
