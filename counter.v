`include "clockGenerator.v"
`include "universalShiftReg.v"
`include "CarryLookAheadFullAdder.v"

module Counter(clk,reset,enable,MSBin,LSBin,s1,s0);
    input clk,reset,enable,MSBin,LSBin,s1,s0;

    wire [3:0] a,b;


    clockGenerator cg(.clk(clk));
    carry_lookahead_adder FA(.X(a),.Y{0,4},.result(b));
    shiftReg shiftRegister(.Datain(b),.MSBin(MSBin),.LSBin(LSBin),.clk(clk),.rst(reset),.s1(s1),.s0(s0),.Dataout(a));

endmodule