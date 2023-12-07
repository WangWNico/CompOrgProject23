`include "memory.v"

module CPU (
  input wire clk,
  input wire rst,
);
  
  // internal registers
  // reg [15:0] instruction;
  // reg [15:0] op1, op2, result;
  
  // TODO
  // instruction fetch
  Fetch CPU_fetch (

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