// Testbench for factorial

`timescale 1ns / 1ps  // Set the timescale for simulation

`include "CPU.v"

module Testbench;

  parameter MEM_SIZE = 64 * 1024;

  // MEMORY DECLARATION
  reg [7:0] MEMORY[0:MEM_SIZE-1];

  CPU u_CPU (
    .clk(clk),
    .rst(clk),
    .MEMORY(MEMORY),
  );

  initial begin
    // Initialize initial memory values with instructions
    
  end

  // Monitor and display results
  always @* begin
    $display("Time=%0t A=%b B=%b Y=%b", $time, A, B, Y);
  end

endmodule
