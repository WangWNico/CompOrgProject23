// Execute & Memory (E&M):
//   Purpose: Perform memory operations (load and store).
//   Activities:
//     For load instructions, read data from memory.
//     For store instructions, write data to memory.
//   Pipeline Stage:
//     E&M stage is responsible for memory operations.

`timescale 1ns / 1ps

module Execute_Memory 
  # (
      parameter MEM_SIZE = 64 * 1024,
    )
(
  input clk,
  input rst,
  input halt_program,

  input [7:0] OP_code,
  input [7:0] value,
  input halt_program,
  input [15:0] MBR,
  input [15:0] MAR,
  input [7:0] MEMORY[0:MEM_SIZE-1],
  output [15:0] PC,
  output [15:0] data_out
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // reset memory to zero
      for (int i = 0; i < MEM_SIZE; i = i + 1) begin
        memory[i] <= 8'h00;
      end
    end else if (halt_program) begin
      ;
    end else begin
      #25;
      case (OP_Code)
        8'b00000000: // halt
          halt_program <= 1;
        8'b00000001: // add
          MAR <= value;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          data_out <= AC + MBR;
        8'b00000010: // sub
          MAR <= value;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          data_out <= AC - MBR;
        8'b00000011: // load
          MAR <= value;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          data_out <= MBR;
        8'b00000100: // store
          MAR <= value;
          MBR <= AC;
          MEMORY[MAR] <= MBR[7:0];
          MEMORY[MAR] <= MBR[15:8];
        8'b00000101: // clear
          data_out <= 16'b0;
        8'b00000110: // skip
          if ((value == 0 and AC < 0) or 
            (value == 2 and AC == 0) or
            (value == 4 and AC > 0)) begin
              PC <= PC + 1;
          end
        8'b00000111: // jump
          PC <= value;
        8'b00001000: // and
          MAR <= value;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          data_out <= AC & MBR;
        8'b00001001: // or
          MAR <= value;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          data_out <= AC | MBR;
        8'b00001010: // not
          data_out <= ~AC;
        8'b00001011: // jump link
          MAR <= value;
          MBR <= PC + 1;
          MEMORY[MAR] <= MBR[7:0];
          MEMORY[MAR+1] <= MBR[15:8];
          data_out <= value + 1;
          PC <= AC
        8'b00001100: // return
          MAR <= value;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          MAR <= MBR;
          MBR <= {MEMORY[MAR+1], MEMORY[MAR]};
          PC <= MBR;
        
      endcase
    end
  end
endmodule
