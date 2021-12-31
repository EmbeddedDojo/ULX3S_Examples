module top(input clk_25mhz,
           input [6:0] btn,
           output [7:0] led);

parameter  N = 100000000;
parameter WIDTH =  $clog2 (N);

wire clk;
wire locked;
wire [WIDTH - 1 : 0] counter_out;

pll PLL(
        .reset   (1'b0), // 0:inactive, 1:reset
        .clk_in  (clk_25mhz), // 25 MHz, 0 deg
        .clk_out (clk), // 10 MHz, 0 deg
        .locked  (locked));

nbit_counter #(.N(N))
             COUNTER
             (.clk         (clk),
              .rst_n       (btn[0]),
              .enable      (1'b1),
              .counter_out (counter_out));


assign led = counter_out [WIDTH - 1 : $clog2 (N)-8 ];
/*
assign led[0] = counter_out[$clog2 (N)-1];   // Assing MSB bit to LED to toggle
assign led[7] = locked;             // Turn on when PLL is locked
assign led[6:1] = 5'b0;             // Turn off other LEDs
*/
endmodule
