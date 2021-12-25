all:
	yosys top.v -p "synth_ecp5 -json top.json" \
	&& nextpnr-ecp5 --85k --json top.json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config --package CABGA381 \
	&& ecppack ulx3s_out.config ulx3s.bit

flash:
	fujprog ulx3s.bit

clean:
	rm *.bit *.json *.config
