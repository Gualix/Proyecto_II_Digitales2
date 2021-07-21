yosys:
	yosys yosys.ys

ejecutar:
	iverilog -o contador banco_contador.v 
	vvp contador
	gtkwave contador.vcd	
gtk:
	gtkwave ondas_contador.gtkw
