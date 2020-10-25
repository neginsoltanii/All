module shiftReg(MSBin,LSBin,s1,s0,clk,rst,MSBout,LSBout,Datain,Dataout);
    input clk,rst,MSBin,LSBin,s1,s0;
    input [3:0] Datain;
    output MSBout,LSBout;
    output reg[3:0] Dataout;
    
    assign MSBout=Dataout[3];
    assign LSBout=Dataout[0];

    always @(negedge clk)
        begin
          if(rst) Dataout<=0;
          else
            case({s1,s0})
                0:Dataout<=Dataout; //hold
                1:Dataout<={MSBin,Dataout[3:1]}; //Shift Right
                2:Dataout<={Dataout[2:0],LSBin}; //Shift Left
                3:Dataout<=Datain; //Parallel Load
            endcase
        end

endmodule