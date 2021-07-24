`include "conexion.v"
`include "probador_modulo.v"
//`include "cmos_cells.v"




module Banco_Fifo();

	parameter address_width = 8;
	parameter data_width = 10;

	wire clk;
    wire reset;
	wire [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3;
	wire [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7;
	wire pop4, pop5, pop6, pop7;
	wire push0, push1,push2, push3;
	wire [7:0] empty_fifos;
	wire [2:0] alto,bajo;
	wire [1:0] idx;
	wire req,IDLE;
	wire valid_contador;
	wire [4:0]contador_out;


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
		.alto(alto),
		.bajo(bajo),

		.req(req),
		.IDLE(IDLE),
		.idx(idx),
		.valid_contador(valid_contador),
		.contador_out(contador_out),



		.FIFO_data_out4(FIFO_data_out4),
        .FIFO_data_out5(FIFO_data_out5),
        .FIFO_data_out6(FIFO_data_out6),
        .FIFO_data_out7(FIFO_data_out7),

		.push0(push0),
		.push1(push1),
		.push2(push2),
		.push3(push3),

		.pop4(pop4),
		.pop5(pop5),
		.pop6(pop6),
		.pop7(pop7),

		.empty_fifos(empty_fifos)

		);

	conexion#(
		.data_width   ( 10 ),
		.address_width ( 8 )
    )u_conexion(
		.clk          ( clk          ),
        .reset(reset),
		.alto(alto),
		.bajo(bajo),
		.req(req),
		.IDLE(IDLE),
		.idx(idx),
		.valid_contador(valid_contador),
		.contador_out(contador_out),

        .FIFO_data_in0(FIFO_data_in0),
        .FIFO_data_in1(FIFO_data_in1),
        .FIFO_data_in2(FIFO_data_in2),
        .FIFO_data_in3(FIFO_data_in3),

		.FIFO_data_out4(FIFO_data_out4),
        .FIFO_data_out5(FIFO_data_out5),
        .FIFO_data_out6(FIFO_data_out6),
        .FIFO_data_out7(FIFO_data_out7),

		.push0(push0),
		.push1(push1),
		.push2(push2),
		.push3(push3),

		.pop4(pop4),
		.pop5(pop5),
		.pop6(pop6),
		.pop7(pop7),

		.empty_fifos(empty_fifos)
	);




endmodule
