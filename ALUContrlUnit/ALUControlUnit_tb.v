`include "ALUControlUnit.v"
module ALUControlUnit();
  reg[6:0]Function7;
  reg[2:0]Function3;
  reg[1:0]ALUOpcode;
  wire[3:0]ALUControlInput;
  ALUControlUnit alu_ctrl(Function7,Function3,ALUOpcode,ALUControlInput);
  
  initial begin
    
		ALUOpcode = 2'b10;
		Function7 = 7'b0000000;
		Function3 = 3'b000;
		#20 $display("ALUOp: %b, Funct7: %b, Funct3: %b\nALUctrl: %b\n", ALUOpcode, Function7, Function3,ALUControlInput);
		ALUOpcode = 2'b10;
		Function7 = 7'b0100000;
		Function3 = 3'b000;
		#20 $display("ALUOp: %b, Funct7: %b, Funct3: %b\nALUctrl: %b\n", ALUOpcode, Function7, Function3, ALUControlInput);

  end
endmodule
