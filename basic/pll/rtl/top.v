module top(input [6:0] btn,
           output [7:0] led);

           assign led[7:0] = {0,btn[1],btn[2],btn[5],btn[4],btn[6],btn[3],~btn[0]};
endmodule
