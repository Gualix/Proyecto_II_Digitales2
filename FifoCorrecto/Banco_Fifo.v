`include "Fifo.v"
`include "probador_fifo.v"
`include "cmos_cells.v"

//`include "memoria.v"
`include "Fifo_synth.v"

module Banco_Fifo();
	parameter address_width = 8;
	parameter data_width = 10;

	wire [data_width-1:0] FIFO_data_in;
	wire [data_width-1:0] FIFO_data_out, FIFO_data_out_synth;
	wire [2:0] alto, bajo;
	wire pop, push;
	wire wr_enable, rd_enable;
	
	wire full_fifo;
    wire empty_fifo;
    wire almost_empty_fifo;
    wire almost_full_fifo;
    

	wire full_fifo_synth;
    wire empty_fifo_synth;
    wire almost_empty_fifo_synth;
    wire almost_full_fifo_synth;
   

	probador_fifo#(
		.data_width   ( 10 ),
		.address_width ( 8 )
	)u_probador_fifos(/*AUTOINST*/
			  // Outputs
			  .clk			(clk),
			  .reset		(reset),
			  .FIFO_data_in		(FIFO_data_in[data_width-1:0]),
			  .pop			(pop),
			  .push			(push),
			  .alto			(alto[2:0]),
			  .bajo			(bajo[2:0]),
			  // Inputs
			  .wr_enable		(wr_enable),
			  .rd_enable		(rd_enable),
			  .wr_enable_synth	(wr_enable_synth),
			  
			  .full_fifo		(full_fifo),
			  .full_fifo_synth	(full_fifo_synth),
			  
			  .empty_fifo		(empty_fifo),
			  .empty_fifo_synth	(empty_fifo_synth),
			  
			  .almost_empty_fifo		(almost_empty_fifo),
			  .almost_empty_fifo_synth	(almost_empty_fifo_synth),
			  
			  .almost_full_fifo	(almost_full_fifo),
			  .almost_full_fifo_synth(almost_full_fifo_synth),
			  

			  .rd_enable_synth	(rd_enable_synth),
			  .FIFO_data_out	(FIFO_data_out[data_width-1:0]),
			  .FIFO_data_out_synth	(FIFO_data_out_synth[data_width-1:0]));


	Fifo#(
		.data_width   ( 10 ),
		.address_width ( 8 )
	)u_fifo(/*AUTOINST*/
		// Outputs
		.wr_enable		(wr_enable),
		.rd_enable		(rd_enable),
		.full_fifo			(full_fifo),
		.empty_fifo			(empty_fifo),
		.almost_empty_fifo	(almost_empty_fifo),
		.almost_full_fifo	(almost_full_fifo),
		
		.FIFO_data_out		(FIFO_data_out[data_width-1:0]),
		// Inputs
		.clk			(clk),
		.reset			(reset),
		.FIFO_data_in		(FIFO_data_in[data_width-1:0]),
		.pop			(pop),
		.push			(push),
		.alto			(alto[2:0]),
		.bajo			(bajo[2:0]));


	Fifo_synth u_fifosynth(/*AUTOINST*/
			       // Outputs
			       .FIFO_data_out_synth(FIFO_data_out_synth[9:0]),
			       .almost_empty_fifo_synth(almost_empty_fifo_synth),
			       .almost_full_fifo_synth(almost_full_fifo_synth),
			       .empty_fifo_synth	(empty_fifo_synth),
			       
			       .full_fifo_synth	(full_fifo_synth),
			       .rd_enable_synth	(rd_enable_synth),
			       .wr_enable_synth	(wr_enable_synth),
			       // Inputs
			       .FIFO_data_in	(FIFO_data_in[9:0]),
			       .alto			(alto[2:0]),
			       .bajo			(bajo[2:0]),
			       .clk				(clk),
			       .pop				(pop),
			       .push			(push),
			       .reset			(reset));





endmodule
