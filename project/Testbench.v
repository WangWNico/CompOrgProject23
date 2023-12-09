// Testbench.v
`timescale 1ns / 1ps  // Set the timescale for simulation

`include "CPU.v"

module Testbench;

  // Define signals for testbench
  reg [3:0] A, B;
  wire [7:0] Y;

  // Instantiate the design module
  YourDesign u_design (
    .A(A),
    .B(B),
    .Y(Y)
  );

  // Stimulus generation
  initial begin
    // Initialize input values
    A = 4'b0010;
    B = 4'b1101;

    // Apply inputs and wait for some time
    #10 A = 4'b1010;  // Change input A after 10 time units
    #10 B = 4'b0110;  // Change input B after another 10 time units
    #10 $finish;      // Finish simulation after 10 more time units
  end

  // Monitor and display results
  always @* begin
    $display("Time=%0t A=%b B=%b Y=%b", $time, A, B, Y);
  end

endmodule
