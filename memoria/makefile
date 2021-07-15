all: memoria

memoria:
	yosys -s memoria.ys
	sed -i "s/memoria/memoria_synth/g" memoria_synth.v
	sed -i "s/memo_data_out/memo_data_out_synth/g" memoria_synth.v

	emacs -batch bancopruebas_memoria.v -f verilog-auto -f save-buffer
	iverilog bancopruebas_memoria.v -o banco
	vvp banco
	rm banco
gtk:	
	gtkwave SalidaMemoria.gtkw
