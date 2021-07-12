`include "conexion.v"
`include "probador_modulo.v"
`include "cmos_cells.v"




module Banco_Fifo();
	parameter address_width = 8;
	parameter data_width = 10;

	wire [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3;
	wire [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7;
	wire [2:0] rd_ptr, wr_ptr;
	wire pop, push;

	probador_modulo#(
		.data_width   ( 10 ),
		.address_width ( 8 )
    )u_probador_modulo(
		.clk          ( clk          ),
        .reset(reset),
        .FIFO_data_in0(FIFO_data_in0),




endmodule
