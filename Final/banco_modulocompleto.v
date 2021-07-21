`include "ModuloCompleto.v"
`include "probador.v"
`include "ModuloCompleto_synth.v"
`include "cmos_cells.v"

module banco_modulocompleto();

	parameter address_width = 8;
	parameter data_width = 10;

    //Wires
    wire clk,reset, init;

    //Entradas a los Fifos
	wire [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3;
	//Salidas de los Fifos
    wire [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7;
	 wire [data_width-1:0] FIFO_data_out_synth4,FIFO_data_out_synth5,FIFO_data_out_synth6,FIFO_data_out_synth7;
	//Pops y pushes
    wire pop4, pop5, pop6, pop7;
	wire push0, push1,push2, push3;
    //Al arbitro
    wire [1:0] idx; 
    wire req, IDLE;
	wire [4:0]contador_out;
    
    
    //Entradas de los umbrales de la maquina de estados
    wire [2:0] alto,bajo;

    //Estados
    

	wire [4:0]contador_sint_out;


    ModuloCompleto modulo(/*AUTOINST*/
			  // Outputs
			  .IDLE			(IDLE),
			  .FIFO_data_out4	(FIFO_data_out4[9:0]),
			  .FIFO_data_out5	(FIFO_data_out5[9:0]),
			  .FIFO_data_out6	(FIFO_data_out6[9:0]),
			  .FIFO_data_out7	(FIFO_data_out7[9:0]),
			  .valid_contador	(valid_contador),
			  .contador_out		(contador_out[4:0]),
			  // Inputs
			  .clk			(clk),
			  .reset		(reset),
			  .init			(init),
			  .alto			(alto[2:0]),
			  .bajo			(bajo[2:0]),
			  .FIFO_data_in0	(FIFO_data_in0[9:0]),
			  .FIFO_data_in1	(FIFO_data_in1[9:0]),
			  .FIFO_data_in2	(FIFO_data_in2[9:0]),
			  .FIFO_data_in3	(FIFO_data_in3[9:0]),
			  .push0		(push0),
			  .push1		(push1),
			  .push2		(push2),
			  .push3		(push3),
			  .pop4			(pop4),
			  .pop5			(pop5),
			  .pop6			(pop6),
			  .pop7			(pop7),
			  .idx			(idx[1:0]),
			  .req			(req));



    probador probador_modulo(/*AUTOINST*/
			     // Outputs
			     .clk		(clk),
			     .reset		(reset),
			     .init		(init),
			     .alto		(alto[2:0]),
			     .bajo		(bajo[2:0]),
			     .FIFO_data_in0	(FIFO_data_in0[9:0]),
			     .FIFO_data_in1	(FIFO_data_in1[9:0]),
			     .FIFO_data_in2	(FIFO_data_in2[9:0]),
			     .FIFO_data_in3	(FIFO_data_in3[9:0]),
			     .push0		(push0),
			     .push1		(push1),
			     .push2		(push2),
			     .push3		(push3),
			     .pop4		(pop4),
			     .pop5		(pop5),
			     .pop6		(pop6),
			     .pop7		(pop7),
			     .idx		(idx[1:0]),
			     .req		(req),
			     .IDLE		(IDLE),
			     // Inputs
			     .FIFO_data_out_synth4(FIFO_data_out_synth4[9:0]),
			     .FIFO_data_out_synth5(FIFO_data_out_synth5[9:0]),
			     .FIFO_data_out_synth6(FIFO_data_out_synth6[9:0]),
			     .FIFO_data_out_synth7(FIFO_data_out_synth7[9:0]),
			     .FIFO_data_out4	(FIFO_data_out4[9:0]),
			     .FIFO_data_out5	(FIFO_data_out5[9:0]),
			     .FIFO_data_out6	(FIFO_data_out6[9:0]),
			     .FIFO_data_out7	(FIFO_data_out7[9:0]),
			     .valid_contador	(valid_contador),
			     .contador_out	(contador_out[4:0]));

    ModuloCompleto_synth Sintetizado(/*AUTOINST*/
				     // Outputs
				     .FIFO_data_out_synth4(FIFO_data_out_synth4[9:0]),
				     .FIFO_data_out_synth5(FIFO_data_out_synth5[9:0]),
				     .FIFO_data_out_synth6(FIFO_data_out_synth6[9:0]),
				     .FIFO_data_out_synth7(FIFO_data_out_synth7[9:0]),
				     .IDLE		(IDLE),
				     .contador_out	(contador_out[4:0]),
				     .valid_contador	(valid_contador),
				     // Inputs
				     .FIFO_data_in0	(FIFO_data_in0[9:0]),
				     .FIFO_data_in1	(FIFO_data_in1[9:0]),
				     .FIFO_data_in2	(FIFO_data_in2[9:0]),
				     .FIFO_data_in3	(FIFO_data_in3[9:0]),
				     .alto		(alto[2:0]),
				     .bajo		(bajo[2:0]),
				     .clk		(clk),
				     .idx		(idx[1:0]),
				     .init		(init),
				     .pop4		(pop4),
				     .pop5		(pop5),
				     .pop6		(pop6),
				     .pop7		(pop7),
				     .push0		(push0),
				     .push1		(push1),
				     .push2		(push2),
				     .push3		(push3),
				     .req		(req),
				     .reset		(reset));




endmodule
