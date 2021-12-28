module hex2bin_decoder(input      [3:0] hex,
                       output reg [7:0] bin);

       always @ ( * ) begin
         case (hex)
           4'h0:    bin = 8'b0000_0000;
           4'h1:    bin = 8'b0000_0001;
           4'h2:    bin = 8'b0000_0010;
           4'h3:    bin = 8'b0000_0100;
           4'h4:    bin = 8'b0000_1000;
           4'h5:    bin = 8'b0001_0000;
           4'h6:    bin = 8'b0010_0000;
           4'h7:    bin = 8'b0100_0000;
           4'h8:    bin = 8'b1000_0000;
           default: bin = 8'b0000_0000;
         endcase
       end
endmodule


/* iverilog hex2bin_decoder_tb.v hex2bin_decoder.v -o tb.out */
