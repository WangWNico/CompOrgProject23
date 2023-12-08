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
  parameter NUM_BLOCKS = 8;
  parameter BLOCK_SIZE = NUM_BLOCKS * 1024;


  // size in bits
  parameter CACHE_SIZE = 40000;

  // Addrssing parameters TODO
  // parameter BLOCK_OFFSET_BITS = $clog2(BLOCK_SIZE / WORD_SIZE);
  // parameter BLOCK_INDEX_BITS = $clog2(MEM_SIZE / BLOCK_SIZE);
  // parameter WORD_OFFSET_BITS = $clog2(BLOCK_SIZE / WORD_SIZE);

  // REGISTERS
  reg [15:0] AC, MAR, MBR, IR, PC;
  reg [7:0] OP_code;
  reg [7:0] value;
  reg [15:0] A = 0;
  reg [15:0] B = 1;
  reg [15:0] Sum = 0;
  reg [15:0] Ctr = 11;
  reg [15:0] Neg1 = -1;


  // MEMORY DECLARATION
  reg [7:0] MEMORY[0:MEM_SIZE-1];

  always @(posedge clk or posedge rst) begin
    // instruction fetch
    Fetch CPU_fetch (
      .clk(clk),
      .rst(rst),
      .PC(PC),
      .MEMORY(MEMORY),
      .IR(IR)
    );

    // instruction decode
    Decoder CPU_decoder (
      .clk(clk),
      .rst(rst),
      .IR(IR),
      .OP_Code(OP_code),
      .value(value),
    );

    // execute
    Execute CPU_execute (
      .clk(clk),
      .rst(rst),
      .OP_Code(OP_code), // connects the output of the decoder to the input of execute
      .value(value),
      .result(result), // connects the output of execute to the next stage
    );

    // memory
    Memory CPU_memory (
      .clk(clk),
      .rst(rst),
      .address(address), // connects the output of the execute stage to the input of the memory
      .data_in(result), // connects the output of execute stage of the input  of the memory
      .mem_read(mem_read_signal), // add signal for mem read
      .mem_write(mem_write_signal), // add signal for mem write
      .data_out(data_out) // transitions memory output to the next stage
    );

    Writeback CPU_writeback (

    );
  end

endmodule