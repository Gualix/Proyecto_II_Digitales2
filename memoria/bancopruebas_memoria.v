
`include "memoria.v"
`include "probador_memoria.v"
`include "memoria_synth.v"
`include "cmos_cells.v"

module bancopruebas_memoria();
	parameter address_width = 8;
	parameter data_width = 10;

	wire [data_width-1:0] memo_data_in;
	wire [data_width-1:0] memo_data_out, memo_data_out_synth;
	wire rdmem_enable, wrmem_enable;
	wire rdmem_enable_synth, wrmem_enable_synth;

	probador_memoria#(
		.data_width   ( 10 ),
		.address_width ( 8 )
	)u_probador_memoria( /*AUTOINST*/
			    // Outputs
			    .clk		(clk),
			    .wrmem_enable	(wrmem_enable),
			    .rdmem_enable	(rdmem_enable),
			    .reset		(reset),
			    .memo_data_in	(memo_data_in[data_width-1:0]),
			    // Inputs
			    .memo_data_out	(memo_data_out[data_width-1:0]),
			    .memo_data_out_synth(memo_data_out_synth[data_width-1:0]));


	memoria#(
		.data_width   ( 10 ),
		.address_width ( 8 )
	)u_memoria(/*AUTOINST*/
		   // Outputs
		   .memo_data_out	(memo_data_out[data_width-1:0]),
		   // Inputs
		   .memo_data_in	(memo_data_in[data_width-1:0]),
		   .clk			(clk),
		   .reset		(reset),
		   .wrmem_enable	(wrmem_enable),
		   .rdmem_enable	(rdmem_enable));

	memoria_synth u_memoria_synth(/*AUTOINST*/
				      // Outputs
				      .memo_data_out_synth(memo_data_out_synth[9:0]),
				      // Inputs
				      .clk		(clk),
				      .memo_data_in	(memo_data_in[9:0]),
				      .rdmem_enable	(rdmem_enable),
				      .reset		(reset),
				      .wrmem_enable	(wrmem_enable));



endmodule
