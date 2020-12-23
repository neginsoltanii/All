module ControlUnit(input [6:0]Input,output reg ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,output reg[1:0]ALUOp);
  always @(*)begin
    case(Input)
      7'b0110011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b00100010;
      7'b0000011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b11110000;
      7'b0100011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b10001000;
      7'b1100011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b00000101;
      default:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'bxxxxxxxx;
    endcase
  end
endmodule
