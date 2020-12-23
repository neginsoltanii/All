module ALUControlUnit(input[6:0]Function7,input[2:0]Function3,input[1:0]ALUOpcode,output reg[3:0]ALUControlInput);
  always@(*)begin
    case(ALUOpcode)
      2'b00:ALUControlInput=4'b0010;
      2'b01:ALUControlInput=4'b0010;
      2'b10:begin
        if(Function7==7'b0000000 && Function3==3'b000)ALUControlInput=4'b0010;
        if(Function7==7'b0100000 && Function3==3'b000)ALUControlInput=4'b0110;
        if(Function7==7'b0000000 && Function3==3'b111)ALUControlInput=4'b0000;
        if(Function7==7'b0000000 && Function3==3'b110)ALUControlInput=4'b0001;
      end
      default:ALUControlInput=4'bxxxx;
    endcase
  end
endmodule
