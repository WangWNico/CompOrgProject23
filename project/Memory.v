Memory (MEM):
  Purpose: Perform memory operations (load and store).
  Activities:
    For load instructions, read data from memory.
    For store instructions, write data to memory.
  Pipeline Stage:
    MEM stage is responsible for memory operations.
  Hazards:
    Cache misses or delays in accessing memory can introduce pipeline stalls.


module Memory (
  input wire clk,
  input wire rst,

  input wire [15:0] address,
  input wire [15:0] data_in,
  input wire write_enable,
  output wire [15:0] data_out
);

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