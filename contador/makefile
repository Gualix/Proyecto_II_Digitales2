yosys:
	yosys yosys.ys
seds:
	sed -i 's/module contador/module contador_s/g' contador_s.v
	sed -i 's/valid_contador/valid_contador_s/g' contador_s.v
	sed -i 's/contador_out/contador_out_s/g' contador_s.v	

ejecutar:
	iverilog -o contador banco_contador.v 
	vvp contador
	gtkwave contador.vcd	
