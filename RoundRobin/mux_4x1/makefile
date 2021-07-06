NOMBRE=banco_mux4x1
BANCO=$(NOMBRE).v
SYNTH=roundRobin_Synth.v
VCD=mux_4x1.vcd
VC=iverilog

EJEC=out_mux4x1
VR=vvp
FLAGSVC= -o $(EJEC)

FLAGSLIMP=rm *.vcd $(EJEC) $(SYNTH)

YOSYS=yosys
YOSFILE=yosy.ys
GTKCONFIG=config.gtkw
GTK=gtkwave

#all: sintetizar compilar visualizar limpiar

all: compilar #visualizar
	

compilar:
	$(VC) $(BANCO) $(FLAGSVC)
	$(VR) $(EJEC)
visualizar:
	$(GTK) $(VCD) $(GTKCONFIG) 

limpiar: 
	$(FLAGSLIMP)


