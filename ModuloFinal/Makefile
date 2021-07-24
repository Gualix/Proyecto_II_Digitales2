
#all:  yosys 
all:  emacs compile gtk
#all:  emacs compile yosys gtk


emacs:
	emacs -batch banco_moduloFinal.v -f verilog-auto -f save-buffer

compile:
	
	iverilog -o test_moduloFinal.vvp banco_moduloFinal.v 
	vvp test_moduloFinal.vvp

yosys:
#	rm moduloFinal_synth.v	
	yosys -s moduloFinal.ys

gtk:
	gtkwave moduloFinal.gtkw