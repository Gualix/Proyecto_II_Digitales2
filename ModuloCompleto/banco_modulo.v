`include "conexion.v"
`include "probador_modulo.v"
`include "cmos_cells.v"




module Banco_Fifo();

	parameter address_width = 8;
	parameter data_width = 10;

	wire clk;
    wire reset;
	wire [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3;
	wire [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7;
	wire pop0, pop1, pop2, pop;
	wire push0, push1,push2, push3;
	wire [7:0] empty_fifos;

	probador_modulo#(
		.data_width   ( 10 ),
		.address_width ( 8 )
    )u_probador_modulo(
		.clk          ( clk          ),
        .reset(reset),
        .FIFO_data_in0(FIFO_data_in0),
        .FIFO_data_in1(FIFO_data_in1),
        .FIFO_data_in2(FIFO_data_in2),
        .FIFO_data_in3(FIFO_data_in3),

		.FIFO_data_out0(FIFO_data_out0),
        .FIFO_data_out1(FIFO_data_out1),
        .FIFO_data_out2(FIFO_data_out2),
        .FIFO_data_out3(FIFO_data_out3),

		.push0(push0),
		.push1(push1),
		.push2(push2),
		.push3(push3),

		.pop0(pop0),
		.pop1(pop1),
		.pop2(pop2),
		.pop3(pop3),

		.empty_fifos(empty_fifos)

		);

	conexion#(
		.data_width   ( 10 ),
		.address_width ( 8 )
    )u_conexion(
		.clk          ( clk          ),
        .reset(reset),
        .FIFO_data_in0(FIFO_data_in0),
        .FIFO_data_in1(FIFO_data_in1),
        .FIFO_data_in2(FIFO_data_in2),
        .FIFO_data_in3(FIFO_data_in3),

		.FIFO_data_out0(FIFO_data_out0),
        .FIFO_data_out1(FIFO_data_out1),
        .FIFO_data_out2(FIFO_data_out2),
        .FIFO_data_out3(FIFO_data_out3),

		.push0(push0),
		.push1(push1),
		.push2(push2),
		.push3(push3),

		.pop0(pop0),
		.pop1(pop1),
		.pop2(pop2),
		.pop3(pop3),

		.empty_fifos(empty_fifos)
	);




endmodule
