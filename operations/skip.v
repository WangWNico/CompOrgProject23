module skip (
  input clk,
  input rst,

  input [15:0] AC,
  output reg [31:0] PC
);
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      pass;
    end else begin
      case (AC)
        0: begin
          if (AC < 0) begin
            PC <= PC + 1;
          end
        end
        2: begin
          if (AC == 0) begin
            PC <= PC + 1;
          end
        end
        4: begin
          if (AC > 0) begin
            PC <= PC + 1;
          end
        end
      endcase
    end
  end

endmodule