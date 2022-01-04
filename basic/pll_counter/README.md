# PLL Counter

This example instantiates a Yosys PLL to create a 10MHz clock
from a 25MHz input clock that is mounter in the board.

To obtain the module, `ecpppl` has been used (check rtl/generate_pll_module.sh)

This clock signals is used to fed a counter module which displays
the most 8 bits of the counter in the board LEDs'.

You can use the PWR button to reset the counter.

