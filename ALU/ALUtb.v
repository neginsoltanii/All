`include "ALU.v"
module ALU_tb();
  reg [63:0]A,B;
  reg[3:0]ALUctrlInput;
  wire [63:0]R;
  wire zero;
  ALU uut(A,B,ALUctrlInput,R,zero);
  
  initial begin
    A=85;
    B=850000;
    ALUctrlInput=4'b0000;
    #20 $display("A: %d, B: %d, operation: AND\nResult: %d", A, B, R);
  end
endmodule
