`include "Fetch.v"
`include "Decoder.v"
`include "Execute.v"
`include "Memory.v"
`include "Writeback.v"

module CPU (
  input wire clk,
  input wire rst,
);

  // CONSTANTS
  // size in bytes
  parameter WORD_SIZE = 2;
  parameter MEM_SIZE = 64 * 1024;
  parameter BLOCK_SIZE = 8 * 1024;

  parameter NUM_BLOCKS = 8;

  // size in bits
  parameter CACHE_SIZE = 40000;

  // Addrssing parameters TODO
  // parameter BLOCK_OFFSET_BITS = $clog2(BLOCK_SIZE / WORD_SIZE);
  // parameter BLOCK_INDEX_BITS = $clog2(MEM_SIZE / BLOCK_SIZE);
  // parameter WORD_OFFSET_BITS = $clog2(BLOCK_SIZE / WORD_SIZE);

  // REGISTERS
  reg [17:0] AC, PC, MAR, MBR, IR;

  // MEMORY DECLARATION
  reg [7:0] MEMORY[0:MEM_SIZE-1];
  reg [1:0] STATE;


  // internal registers
  // reg [15:0] instruction;
  // reg [15:0] op1, op2, result;

  // TODO
  // instruction fetch
  Fetch CPU_fetch (
    .clk(clk),
    .rst(rst),
    .PC(PC),
    .memory(MEMORY),
    .MAR(MAR),
    .MBR(MBR),
    .AC(AC)
  );

  // instruction decode
  Decoder CPU_decoder (
    
  );

  // execute
  Execute CPU_execute (

  );

  // memory
  Memory CPU_memory (
    .clk(clk),
    .rst(rst),

  );

  Writeback CPU_writeback (

  );

endmodule