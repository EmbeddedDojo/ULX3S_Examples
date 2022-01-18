// diamond 3.7 accepts this PLL
// diamond 3.8-3.9 is untested
// diamond 3.10 or higher is likely to abort with error about unable to use feedback signal
// cause of this could be from wrong CPHASE/FPHASE parameters
module pll
(
    input reset, // 0:inactive, 1:reset
    input clk_in, // 25 MHz, 0 deg
    output clk_out, // 10 MHz, 0 deg
    output locked
);
wire clkfb;
(* FREQUENCY_PIN_CLKI="25" *)
(* FREQUENCY_PIN_CLKOP="10" *)
(* ICP_CURRENT="12" *) (* LPF_RESISTOR="8" *) (* MFG_ENABLE_FILTEROPAMP="1" *) (* MFG_GMCREF_SEL="2" *)
EHXPLLL #(
        .PLLRST_ENA("ENABLED"),
        .INTFB_WAKE("DISABLED"),
        .STDBY_ENABLE("DISABLED"),
        .DPHASE_SOURCE("DISABLED"),
        .OUTDIVIDER_MUXA("DIVA"),
        .OUTDIVIDER_MUXB("DIVB"),
        .OUTDIVIDER_MUXC("DIVC"),
        .OUTDIVIDER_MUXD("DIVD"),
        .CLKI_DIV(5),
        .CLKOP_ENABLE("ENABLED"),
        .CLKOP_DIV(60),
        .CLKOP_CPHASE(30),
        .CLKOP_FPHASE(0),
        .FEEDBK_PATH("INT_OP"),
        .CLKFB_DIV(2)
    ) pll_i (
        .RST(reset),
        .STDBY(1'b0),
        .CLKI(clk_in),
        .CLKOP(clk_out),
        .CLKFB(clkfb),
        .CLKINTFB(clkfb),
        .PHASESEL0(1'b0),
        .PHASESEL1(1'b0),
        .PHASEDIR(1'b1),
        .PHASESTEP(1'b1),
        .PHASELOADREG(1'b1),
        .PLLWAKESYNC(1'b0),
        .ENCLKOP(1'b0),
        .LOCK(locked)
	);
endmodule