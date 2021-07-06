all: memoria

	

memoria:

	iverilog -o test_fifo.vvp Banco_Fifo.v 
	vvp test_fifo.vvp
	gtkwave FifoPushPop.vcd
