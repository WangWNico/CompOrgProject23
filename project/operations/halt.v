// output halt_program signals when program has ended
// check this value in main function
module halt (
  input clk,
  input rst,
  
  input wire halt_signal,
  output reg program_halted
);
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      halt_signal <= 1'b0; // set to false
      program_halted <= 1'b0
    end else begin
      if (halt_signal) begin
        program_halted <= 1'b1;
      end
    end
  end
endmodule