all:  yosys seds memoria

yosys:
	rm Fifo_synth.v	
	yosys -s Fifo.ys

emacs:
	emacs -batch Banco_Fifo.v -f verilog-auto -f save-buffer

memoria:

	iverilog -o test_fifo.vvp Banco_Fifo.v 
	vvp test_fifo.vvp
	gtkwave FifoPushPop.vcd
