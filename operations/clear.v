module Clear (
  input wire clk,
  input wire reset,
  input wire clear_enable,
  // other inputs and outputs
  output reg [31:0] ac_reg
);

always @(posedge clk or posedge reset) begin
  if (reset) begin
    // Reset all registers including the accumulator
    ac_reg <= 32'b0;
    // Other reset logic for your processor
  end else begin
    // Your normal processor logic here

    // Clear operation
    if (clear_enable) begin
      ac_reg <= 32'b0;  // Set accumulator to 0
      // Additional clear-related logic if needed
    end
  end
end


endmodule
