// Testbench for factorial

`timescale 1ns / 1ps  // Set the timescale for simulation

`include "CPU.v"

module Fibonacci;

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
    MEMORY[8'h00] = 16'h0324; // Load Sum
    #25;
    MEMORY[8'h02] = 16'h0120; // Add A
    #25;
    MEMORY[8'h04] = 16'h0424; // Store Sum
    #25;
    MEMORY[8'h06] = 16'h0324; // Load Sum
    #25;
    MEMORY[8'h08] = 16'h0222; // Add B
    #25;
    MEMORY[8'h0A] = 16'h0424; // Store Sum 	// Sum = A+B
    #25;
    MEMORY[8'h0C] = 16'h0322; // Load B
    #25;
    MEMORY[8'h0E] = 16'h0420; // Store A
    #25;
    MEMORY[8'h10] = 16'h0324; // Load Sum
    #25;
    MEMORY[8'h12] = 16'h0422; // Store B		// B = Sum
    #25;
    MEMORY[8'h14] = 16'h0326; // Load Ctr
    #25;
    MEMORY[8'h16] = 16'h0128; // Add Neg1
    #25;
    MEMORY[8'h18] = 16'h0426; // Store Ctr	// ctr = ctr -1
    #25;
    MEMORY[8'h1A] = 16'h0600; // Skip 400	// 2: skips if AC(ctr) == 0, 400 hex in bin = 0100 000 000
    #25;
    MEMORY[8'h1C] = 16'h0700; // Jump Loop
    #25;
    MEMORY[8'h1E] = 16'h0000; // Halt
    #25;
  end

  // Monitor and display results
  always @* begin
    $display("Time=%0t A=%b B=%b Y=%b", $time, A, B, Y);
  end

endmodule
