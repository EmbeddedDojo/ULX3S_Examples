`timescale 1us / 1ns

module nbit_counter_tb();

parameter N = 16;
reg clk = 0;
reg rst_n;
reg enable;
wire [ ($clog2(N)-1) : 0 ] counter_out;

nbit_counter #(.N(N))
             COUNTER
             (.clk         (clk),
              .rst_n       (rst_n),
              .enable      (enable),
              .counter_out (counter_out));

always begin #0.5 clk = ~ clk; end //Create clk signal

initial begin

  //-- Store Results
  $dumpfile("nbit_counter_tb.vcd");
  $dumpvars(0, nbit_counter_tb);
  $display("\t\t|--------------------------------|");
  $display("\t\t|  Executing test...             |");
  $display("\t\t|--------------------------------|");


  $monitor ($time, " enable %b, counter_out %d", enable, counter_out);
  #4 rst_n = 0; enable = 1; //Wait to see that dose not count and Enable control signals
  repeat(10) @(posedge clk);
  #1 rst_n = 1;
  repeat(20) @(posedge clk);
  #1 enable = 0; // Disable and check if does not count
  repeat(5) @(posedge clk);
  #1 enable = 1; //Enable again
  repeat(15) @(posedge clk);
  $finish;
end
endmodule
