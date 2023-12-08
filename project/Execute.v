Execute (EX):
    Purpose: Execute the operation specified by the instruction.
    Activities:
        Perform arithmetic or logic operations based on the decoded instruction.
        Calculate memory addresses for load/store instructions.
    Pipeline Stage:
        EX stage is responsible for executing the instruction.
    Hazards:
        Control hazards, such as branch mispredictions, can cause pipeline stalls.

module Execute (
  input clk,
  input rst,
  
  input [7:0] OP_code,
  input [7:0] value,
  input halt_program,
  input [15:0] MBR,
  input [15:0] MAR,
  output [15:0] AC,
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      AC <= 16'b0;
    end else begin
      case (OP_Code)
        8'b00000000: // halt
          halt_program <= 1;
        8'b00000001: // add
          MAR <= value;
          MBR <= 
          AC <= AC + 
      endcase
    end
  end

endmodule