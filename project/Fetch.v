// Instruction Fetch (IF):
// Purpose: Fetch the next instruction from memory.
// Activities:
//   Increment the program counter (PC) to point to the next instruction.
//   Access memory at the updated PC to fetch the instruction.
// Pipeline Stage:
//   IF stage is responsible for fetching the instruction.
`timescale 1ns / 25ps

module Fetch 
  # (
      parameter MEM_SIZE = 64 * 1024,
    )
(
  input clk,
  input rst,
  input halt_program,
  
  input [15:0] PC,
  input [7:0] MEMORY[0:MEM_SIZE-1],
  output [15:0] IR,
);

  reg [15:0] PC_next <= PC + 1;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      IR <= 16'b0;
      PC <= 16'b0;
    end else if (halt_program) begin
      ;
    end else begin
      #25;
      IR <= {Memory[PC+1], MEMORY[PC]}
      PC <= PC + 1;
    end
  end

endmodule