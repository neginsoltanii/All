module ALU(input [63:0]A,B,input[3:0]ALUctrlInput,output reg [63:0]R,output reg zero);
  
  always@(*)begin
    case (ALUctrlInput)
      4'b0010:R=A+B;
      4'b0110:R=A-B;
      4'b0000:R=A&B;
      4'b0001:R=A|B;
      default:R=64'hxxxxxxxxxxxxxxxx;
    endcase
    if(R==0)zero=1;
    else zero=0;
  end
endmodule