module mux_4_to_1(w0,w1,w2,w3,s0,s1,f);
input w0,w1,w2,w3,s0,s1;
output reg f;

always @(*)
    if(s0==0 & s1==0)
        f=w0;
    else if(s0==0 & s1==1)
        f=w1;
    else if(s0==1 & s1==0)
        f=w2;
    else
        f=w3;
endmodule