`include "Fifo.v"
`include "probador_fifo.v"
`include "cmos_cells.v"
`include "memoria.v"
`include "Fifo_synth.v"

module Banco_Fifo();
	parameter address_width = 8;
	parameter data_width = 10;

	wire [data_width-1:0] FIFO_data_in;
	wire [data_width-1:0] FIFO_data_out, FIFO_data_out_synth;
	wire [2:0] rd_ptr, wr_ptr;







	probador_fifo#(
		.data_width   ( 10 ),
		.address_width ( 8 )
	)u_probador_fifos(
		.clk          ( clk          ),
		.wr_enable    ( wr_enable    ),
		.rd_enable    ( rd_enable    ),
		.reset        ( reset        ),
		.FIFO_data_in ( FIFO_data_in [data_width-1:0] ),
		.wr_ptr       ( wr_ptr [2:0]      ),
		.rd_ptr       ( rd_ptr [2:0]      ),
		.FIFO_data_out ( FIFO_data_out [data_width-1:0] ),
		.FIFO_data_out_synth (FIFO_data_out_synth [data_width-1:0])
	);


	Fifo#(
		.data_width   ( 10 ),
		.address_width ( 8 )
	)u_fifo(
		.data_in ( FIFO_data_in [data_width-1:0]),
		.clk          ( clk          ),
		.reset        ( reset        ),
		.wr_enable    ( wr_enable    ),
		.rd_enable    ( rd_enable    ),
		.wr_ptr       ( wr_ptr [2:0]),
		.rd_ptr       ( rd_ptr [2:0]),
		.FIFO_data_out ( FIFO_data_out [data_width-1:0])
	);


	Fifo_synth u_fifosynth(
		.data_in ( FIFO_data_in [data_width-1:0]),
		.clk          ( clk          ),
		.reset        ( reset        ),
		.wr_enable    ( wr_enable    ),
		.rd_enable    ( rd_enable    ),
		.wr_ptr       ( wr_ptr [2:0]),
		.rd_ptr       ( rd_ptr [2:0]),
		.FIFO_data_out_synth ( FIFO_data_out_synth [data_width-1:0])
	);
 



endmodule
