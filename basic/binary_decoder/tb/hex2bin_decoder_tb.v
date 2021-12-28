`timescale 1us/1ns

module hex2bin_decoder_tb();
  reg  [3:0]  hex_in;
  wire [7:0]  decoded_val;

  integer error_cnt = 0;

  hex2bin_decoder HEX2BIN(
    .hex(hex_in),
    .bin(decoded_val)
    );

    initial begin

      //-- Store Results
      $dumpfile("hex2bin_decoder_tb.vcd");
      $dumpvars(0, hex2bin_decoder_tb);
      $display("\t|--------------------------------|");
      $display("\t  Executing test... Results are:");
      $display("\t|--------------------------------|");

      hex_in = 4'h0;
      #1 hex_in = 4'h2;
      #1 if (decoded_val == 8'b0000_0010) $display("\t\t- OK");
         else begin $display("\t\t- NOK"); error_cnt += 1; end

      #1 hex_in = 4'h1;
      #1 if (decoded_val == 8'b0000_0001) $display("\t\t- OK");
         else begin $display("\t\t- NOK"); error_cnt += 1; end

      #1 hex_in = 4'h6;
      #1 if (decoded_val == 8'b0010_0000) $display("\t\t- OK");
         else begin $display("\t\t- NOK"); error_cnt += 1; end

      #1 hex_in = 4'h7;
      #1 if (decoded_val == 8'b0100_0000) $display("\t\t- OK");
         else begin $display("\t\t- NOK"); error_cnt += 1; end

      #1 hex_in = 4'h8;
      #1 if (decoded_val == 8'b1000_0000) $display("\t\t- OK");
         else begin $display("\t\t- NOK"); error_cnt += 1; end

      #1 hex_in = 4'h3;
      #1 if (decoded_val == 8'b0000_0100) $display("\t\t- OK");
         else begin $display("\t\t- NOK"); error_cnt += 1; end

      $display("\t|--------------------------------|");
      if (error_cnt == 0) $display("\t\t Result: PASS");
      else                $display("\t\t Result: FAIL");
      $display("\t|--------------------------------|")         ;
      $display("\nEND of simulation");
      $finish;
    end
endmodule
