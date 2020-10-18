module fulladd(Cin,x,y,s,Cout);
    input Cin,x, y;
    output s,Cout;

    assign s=x^y^Cin,
           Cout=(x&y)|(x&Cin)|(y&Cin); 
endmodule


 
module carry_lookahead_adder(X,Y,result);
    parameter n =4;
    input [n-1:0] X , Y;
    output [n:0] result;

  
     
  wire [n:0]     w_C;
  wire [n-1:0]   w_G, w_P, w_SUM;
 
  // Create the Full Adders
  genvar             i;
  generate
    for (i=0; i<n; i=i+1) 
      begin
        fulladd full_adder
            ( 
              .Cin(w_C[i]),
              .x(X[i]),
              .y(Y[i]),
              .s(w_SUM[i]),
              .Cout()
              );
      end
  endgenerate
 
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  // Create the Propagate Terms: Pi=Ai+Bi
  // Create the Carry Terms:
  genvar j;
  generate
    for (j=0; j<n; j=j+1) 
      begin
        assign w_G[j]   = X[j] & Y[j];
        assign w_P[j]   = X[j] | Y[j];
        assign w_C[j+1] = w_G[j] | (w_P[j] & w_C[j]);
      end
  endgenerate
   
  assign w_C[0] = 1'b0; // no carry input on first adder
 
  assign result = {w_C[n], w_SUM};   
 
endmodule 

//Testbench
module carry_lookahead_adder_tb ();
 
  parameter n = 3;
 
  reg [n-1:0] r_ADD_1 = 0;
  reg [n-1:0] r_ADD_2 = 0;
  wire [n:0]  w_RESULT;
   
  carry_lookahead_adder #(.n(n)) carry_lookahead_inst
    (
     .X(r_ADD_1),
     .Y(r_ADD_2),
     .result(w_RESULT)
     );
 
  initial
    begin
      #10;
      r_ADD_1 = 3'b000;
      r_ADD_2 = 3'b001;
      #10;
      r_ADD_1 = 3'b010;
      r_ADD_2 = 3'b010;
      #10;
      r_ADD_1 = 3'b101;
      r_ADD_2 = 3'b110;
      #10;
      r_ADD_1 = 3'b111;
      r_ADD_2 = 3'b111;
      #10;
    end
 
endmodule