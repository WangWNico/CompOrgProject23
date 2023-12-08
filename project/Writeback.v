// Write Back (WB):
//   Purpose: Write the results of the executed instruction back to registers.
//   Activities:
//       Write the result of the instruction (e.g., the output of ALU operation) to the destination register.
//   Pipeline Stage:
//       WB stage is responsible for writing back the results.
//   Hazards:
//       Dependencies between instructions may cause delays if a result is needed by subsequent instructions.

`timescale 1ns / 25ps

module Writeback (
  input wire clk,
  input wire rst,
  input halt_program,
  
  input reg [15:0] MAR,
  input [15:0] data_out,
  output [15:0] AC,

);

  always @(posedge clk or negedge rst) begin
    if(rst == 0) begin
      ;
    end else if (halt_program) begin
      ;
    end else begin
      #25;
      AC <= data_out;
    end
end
        

endmodule
