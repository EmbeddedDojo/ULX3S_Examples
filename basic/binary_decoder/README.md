# Hex to binary

This example decodes the position of the switches in the SW1 and turn to binary code, lighting up the correspondent LED [7:0]
If the represented value if >8, all the LEDs are turned off.

### tb
The tb folder contains a simple testbench to test out the `hex2bin_decoder` module.

### rtl

The rtl consists of a decoder module and a top module.
The top module is used to connect the physical pins to the decoder module.
