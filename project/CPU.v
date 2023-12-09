`timescale 1ns / 1ps

`include "Fetch.v"
`include "Decoder.v"
`include "Execute_Memory.v"
`include "Writeback.v"

module CPU (
  input wire clk,
  input wire rst,
);

  // CONSTANTS
  // size in bytes
  parameter WORD_SIZE = 2;
  parameter MEM_SIZE = 64 * 1024;
  parameter NUM_BLOCKS = 8;
  parameter BLOCK_SIZE = NUM_BLOCKS * 1024;

  // size in bits
  parameter CACHE_SIZE = 40000;
  
  // Addressing parameters
  parameter BLOCK_OFFSET_BITS = $clog2(BLOCK_SIZE / WORD_SIZE); // Block offset bits
  parameter BLOCK_INDEX_BITS = $clog2(MEM_SIZE / BLOCK_SIZE);   // Block index bits
  parameter WORD_OFFSET_BITS = $clog2(BLOCK_SIZE / WORD_SIZE);  // Word offset bits

  // REGISTERS
  reg [15:0] AC, MAR, MBR, IR, PC;
  reg [7:0] OP_code;
  reg [7:0] value;
  reg halt_program;


  // MEMORY DECLARATION
  reg [7:0] MEMORY[0:MEM_SIZE-1];
  reg [15:0] data_out;

  always @(*) begin
    if (rst) begin
      // unhalt program
      halt_program <= 1'b0;
    end
  end

  // instruction fetch
  Fetch CPU_fetch (
    .clk(clk),
    .rst(rst),
    .halt_program(halt_program),
    .PC(PC),
    .MEMORY(MEMORY),
    .IR(IR)
  );
  
  // instruction decode
  Decoder CPU_decoder (
    .clk(clk),
    .rst(rst),
    .halt_program(halt_program),
    .IR(IR),
    .OP_Code(OP_code),
    .value(value),
  );

  // execute & memory 
  Execute_Memory CPU_execute_memory (
    .clk(clk),
    .rst(rst),
    .halt_program(halt_program),
    .value(value),
    .OP_code(OP_code),
    .halt_program(halt_program),
    .MBR(MBR),
    .MAR(MAR),
    .MEMORY(MEMORY),
    .PC(PC),
    .data_out(data_out), // transitions memory output to the next stage
  );

  // write back to AC
  Writeback CPU_writeback (
    .clk(clk),
    .rst(rst),
    .halt_program(halt_program),
    .MAR(MAR),
    .data_out(data_out),
    .AC(AC),
  );

endmodule