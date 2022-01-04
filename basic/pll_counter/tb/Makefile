sim:
	iverilog nbit_counter_tb.v ../rtl/nbit_counter.v -o tb.out
	./tb.out

display_waveform:
	gtkwave nbit_counter_tb.vcd

clean:
	rm -r tb.out nbit_counter_tb.vcd
