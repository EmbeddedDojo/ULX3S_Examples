module top (
  input   [0:3]  sw,
  output  [7:0]  led);

hex2bin_decoder HEX2BIN(
  .hex (sw),
  .bin (led) );

endmodule
