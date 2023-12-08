Write Back (WB):
  Purpose: Write the results of the executed instruction back to registers.
  Activities:
      Write the result of the instruction (e.g., the output of ALU operation) to the destination register.
  Pipeline Stage:
      WB stage is responsible for writing back the results.
  Hazards:
      Dependencies between instructions may cause delays if a result is needed by subsequent instructions.

module Writeback (
  input wire clk,
  input wire rst,
  input wire regWrite,
  
  input reg [15:0] MAR
  output reg [15:0] writeTo

);

  reg [15:0] internal_register;

  always @(posedge clk or negedge rst) begin
    if(rst == 0)begin
      result_to_register <= 16'b0;
    end else begin
      if(RegWrite) begin 
        if (MAR) begin
            writeTo <= MAR;
        else
            writeTo <= ALUResult;    
        end
      end
    end
end
        

endmodule
