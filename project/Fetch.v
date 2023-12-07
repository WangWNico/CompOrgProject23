Instruction Fetch (IF):
Purpose: Fetch the next instruction from memory.
Activities:
    Increment the program counter (PC) to point to the next instruction.
    Access memory at the updated PC to fetch the instruction.
Pipeline Stage:
    IF stage is responsible for fetching the instruction.
Hazards:
    Branch instructions can cause a branch delay slot, where the next instruction might be fetched even though the branch decision is not yet known.


module Fetch (
  input clk,
  input rst,

  input [15:0] PC,
  input [7:0] MEMORY[0:MEM_SIZE-1],
  input [15:0] MAR,
  input [15:0] MBR
  output [15:0] AC,
);

  reg [15:0] PC_next <= PC + 1;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      PC_next <= 16'b0;
    end else if
  end

endmodule