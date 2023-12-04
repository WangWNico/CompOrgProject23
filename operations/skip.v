module SkipOperation (
  input wire [15:0] AC,      // Accumulator
  input wire [1:0] C, // C code (00: AC < 0, 02: AC = 0, 04: AC > 0)
  output wire [15:0] PC,             // Program Counter
  input wire clk,            // Clock signal
  input wire rst           // Reset signal
);
  always @ (posedge clk or posedge reset) begin
    if (rst) begin
      // Reset values
      PC <= 16'b0;
    end else begin
      if (C) begin
        case (C)
          2'b00: if (AC < 0) PC <= PC + 1; // Skip if AC < 0
          2'b02: if (AC == 0) PC <= PC + 1; // Skip if AC = 0
          2'b04: if (AC > 0) PC <= PC + 1; // Skip if AC > 0
        endcase
      end
    end
  end
endmodule
