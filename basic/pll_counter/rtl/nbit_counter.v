
module nbit_counter
  #( parameter N = 2) //Counter value N - 1
   ( input clk,
     input rst_n,
     input enable,
     output reg [$clog2(N)-1 : 0] counter_out);

always @ ( posedge clk or negedge rst_n ) begin
  if (!rst_n)               counter_out <= 0;
  else if (enable)
    begin
      if (counter_out == N-1) counter_out <= 0;
      else                    counter_out <= counter_out + 1'b1;
    end

end
endmodule
