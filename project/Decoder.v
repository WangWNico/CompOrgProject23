
// Instruction Decode (ID):
//   Purpose: Decode the fetched instruction and read the necessary registers.
//   Activities:
//     Decode the opcode and determine the type of instruction.
//     Read source registers if needed.
//   Pipeline Stage:
//     ID stage is responsible for decoding the instruction.
//   Hazards:
//     Data hazards may occur if a subsequent instruction depends on the result of a previous one.

module Decoder (
  input clk,
  input rst,

  input [15:0] IR,
  output [3:0] OP_code,
  output [11:0] value,
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      OP_code = 8'b0;
      value = 8'b0
    end else begin
      OP_code = IR[15:12];
      value = IR[11:0];
    end
  end
endmodule