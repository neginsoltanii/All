module ClockGenerator(clk);
    parameter n=4;
    integer i;
    output reg clk;

    assign clk=0,
            i=0;

    always @(i)
        begin
          while(i<n)
          begin
            i=i+1;
            #10 clk=~clk;
          end
        end
 endmodule   