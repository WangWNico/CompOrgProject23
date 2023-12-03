module Load (
  input wire [7:0] X,      // Input data (address)
  input wire [7:0] M [255], // Memory array (assuming 256 words of 8 bits each)
  output reg [7:0] AC       // Accumulator
);
  reg [7:0] MAR;   // Memory Address Register
  reg [7:0] MBR;   // Memory Buffer Register

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      // Reset values
      MAR <= 8'b0;
      MBR <= 8'b0;
      AC <= 8'b0;
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
