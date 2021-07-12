all: 
	yosys yosys.ys
	sed -i "s/arbitro/arbitro_sint/g" arbitro_sint.v
	sed -i "s/pop_F0/pop_F0_sint/g" arbitro_sint.v
	sed -i "s/pop_F1/pop_F1_sint/g" arbitro_sint.v
	sed -i "s/pop_F2/pop_F2_sint/g" arbitro_sint.v
	sed -i "s/pop_F3/pop_F3_sint/g" arbitro_sint.v

	sed -i "s/push_F0/push_F0_sint/g" arbitro_sint.v
	sed -i "s/push_F1/push_F1_sint/g" arbitro_sint.v
	sed -i "s/push_F2/push_F2_sint/g" arbitro_sint.v
	sed -i "s/push_F3/push_F3_sint/g" arbitro_sint.v

	emacs -batch bancoRoundRobin.v -f verilog-auto -f save-buffer

	iverilog -o test.vvp bancoRoundRobin.v
	vvp test.vvp
	gtkwave roundRobin.vcd
