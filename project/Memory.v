module Memory (
  input wire clk,
  input wire rst,

  input wire [15:0] address,
  input wire [15:0] data_in,
  input wire write_enable,
  output wire [15:0] data_out
);

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

  // memory array declaration
  reg [70] memory[0:MEM_SIZE-1];

  // little-endian 
  assign data_out = {memory[address + 1], memory[address]};

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // reset memory to zero
      for (int i = 0; i < MEM_SIZE; i = i + 1) begin
        memory[i] <= 8'h00;
      end
    end else if (write_enable) begin
      // write to memory
      memory[address] <= data_in[7:0];
      memory[address + 1] <= data_in[15:8];
    end
  end
endmodule