all:  yosys moduloCompleto

yosys:
	yosys -s Fifo.ys
	sed -i "s/Fifo/Fifo_synth/g" Fifo_synth.v

	sed -i "s/FIFO_data_out/FIFO_data_out_synth/g" Fifo_synth.v
	sed -i "s/rd_ptr/rd_ptr_synth/g" Fifo_synth.v
	sed -i "s/wr_ptr/wr_ptr_synth/g" Fifo_synth.v
	sed -i "s/rd_enable/rd_enable_synth/g" Fifo_synth.v
	sed -i "s/full_fifo/full_fifo_synth/g" Fifo_synth.v
	sed -i "s/wr_enable/wr_enable_synth/g" Fifo_synth.v
	emacs -batch Banco_Fifo.v -f verilog-auto -f save-buffer

moduloCompleto:

	iverilog -o test_modulo.vvp banco_modulo.v 
	vvp test_modulo
	gtkwave FifoPushPop.vcd
