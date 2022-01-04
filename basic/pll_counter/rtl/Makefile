all:
	yosys top.v nbit_counter.v ecp5pll_10mhz.v -p "synth_ecp5 -json top.json" \
	&& nextpnr-ecp5 --85k --json top.json --lpf ../constraints/ulx3s_v20.lpf --textcfg ulx3s_out.config --package CABGA381 \
	&& ecppack ulx3s_out.config ulx3s.bit \
	&& mkdir bin && cp ulx3s.bit bin \
	&& rm ulx3s.bit top.json ulx3s_out.config

flash:
	fujprog bin/ulx3s.bit

clean:
	rm -r bin
