module RegFile (input clock,RegWrite,input [4:0] reg1Read, reg2Read, writereg,input [63:0] writedata,output [63:0] readdata1, readdata2);
  integer i=0;
  reg [63:0] regfile [31:0];
  initial begin
    for(i=0;i<32;i=i+1)
      regfile[i]=0;
  end

  always @(posedge clock)
  begin
    regfile[0]=0;
		  	if (RegWrite) 
	 				regfile[writereg] <= writedata;
  end

  assign readdata1 = regfile[reg1Read];
  assign readdata2 = regfile[reg2Read];
endmodule;
