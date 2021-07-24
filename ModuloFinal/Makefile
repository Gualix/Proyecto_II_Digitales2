all: 
	






	emacs -batch banco_modulocompleto.v -f verilog-auto -f save-buffer



	iverilog -o test_modulocompleto.vvp banco_modulocompleto.v 
	vvp test_modulocompleto.vvp
	gtkwave ModuloCompleto.gtkw
