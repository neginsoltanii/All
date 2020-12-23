`include "ControlUnit.v"
module ControlUnit_tb();
  reg [6:0]Input;
  wire ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
  wire[1:0]ALUOp;
  ControlUnit uut(Input,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);
  
  initial begin
    Input = 7'b0100011;
		#20 $display("OpCode: %b\nALUSrc: %b, MemToReg: %b, RegWrite: %b, MemRead: %b, MemWrite: %b, Branch: %b, ALUOp: %b\n", Input, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
		Input = 7'b1100011;
		#20 $display("OpCode: %b\nALUSrc: %b, MemToReg: %b, RegWrite: %b, MemRead: %b, MemWrite: %b, Branch: %b, ALUOp: %b\n", Input, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);

  end
endmodule