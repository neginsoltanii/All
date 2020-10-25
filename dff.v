module flipflop(D,Clock,reset,Q);
  input D,Clock,reset;
  output reg Q;

  always @(posedge Clock)
    if(reset)
      Q=0;
    else
      Q=D;
endmodule