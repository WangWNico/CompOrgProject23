`include "operations/add.v"
`include "operations/clear.v"
`include "operations/halt.v"
`include "operations/jump.v"
`include "operations/load.v"
`include "operations/skip.v"
`include "operations/store.v"

module alu (
  input [15:0] A, B,
  input [1:0] ALU_Set,
  output [15:0] ALU_Out
);

  reg [15:0] ALU_Result;

  assign ALU_Out = ALU_Result;

  always @(*) begin
    case (ALU_Set)
      // add
      4'b0000:
        ALU_Result = A + B;
      // halt
      4'b0001:
        ALU_Result = 0;
      // load
      4'b0010:
        ALU_Result = 0;
      // store
      4'b0011:
        ALU_Result = 0;
      // clear
      4'b0100:

      // skip
      4'b0101:

      // jump
      4'b0110:

      // sub
      4'b0111:
      
      // and
      4'b1000:

      // or
      4'b1001:

      // not
      4'b1010:

      // jump and link
      4'b1011:

      // return
      4'b1100:

      default: ALU_Result = A;
    endcase
  end

endmodule


input [15:0] r1[16];
input [15:0] r2[16];
input [15:0] r3[16];
input [15:0] r4[16];
input [15:0] r5[16];
input [15:0] r6[16];
input [15:0] r7[16];
input [15:0] r8[16];

ADD
0000
HALT
0001
LD
0010
ST
0011
CLR
0100
SKIP
0101
JMP
0110
SUB
0111
AND
1000
OR
1001
NOT
1010
JMPL
1011
RET
1100

