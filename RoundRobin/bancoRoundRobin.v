`include "arbitro.v"
`include "probador_roundRobin.v"

module bancoRoundRobin();

    wire clk;
    wire reset;
    wire [1:0] select;

	wire almost_full_P0;
	wire almost_full_P1;
	wire almost_full_P2;
	wire almost_full_P3;

    wire empty_P0;
    wire empty_P1;
    wire empty_P2;
    wire empty_P3;

    wire pop_F0;
    wire pop_F1;
    wire pop_F2;
    wire pop_F3;

    wire push_F0;
    wire push_F1;
    wire push_F2;
    wire push_F3;

    wire [9:0] in_FIFO_0;
    wire [9:0] in_FIFO_1;
    wire [9:0] in_FIFO_2;
    wire [9:0] in_FIFO_3;

    wire [9:0] out_FIFO_0;
    wire [9:0] out_FIFO_1;
    wire [9:0] out_FIFO_2;
    wire [9:0] out_FIFO_3;

	wire [9:0] demuxIn;

	arbitro controlador(
		.clk    (clk),
		.reset  (reset),
        
        .almost_full_P0 (almost_full_P0),
        .almost_full_P1 (almost_full_P1),
        .almost_full_P2 (almost_full_P2),
        .almost_full_P3 (almost_full_P3),

        .empty_P0(empty_P0),
        .empty_P1(empty_P1),
        .empty_P2(empty_P2),
        .empty_P3(empty_P3),

        .pop_F0(pop_F0),
        .pop_F1(pop_F1),
        .pop_F2(pop_F2),
        .pop_F3(pop_F3),

        .push_F0(push_F0),
        .push_F1(push_F1),
        .push_F2(push_F2),
        .push_F3(push_F3),

        .in_FIFO_0(in_FIFO_0),
        .in_FIFO_1(in_FIFO_1),
        .in_FIFO_2(in_FIFO_2),
        .in_FIFO_3(in_FIFO_3),

        .out_FIFO_0(out_FIFO_0),
        .out_FIFO_1(out_FIFO_1),
        .out_FIFO_2(out_FIFO_2),
        .out_FIFO_3(out_FIFO_3));

    probador_roundRobin test(
        .clk    (clk),
		.reset  (reset),
        
        .almost_full_P0 (almost_full_P0),
        .almost_full_P1 (almost_full_P1),
        .almost_full_P2 (almost_full_P2),
        .almost_full_P3 (almost_full_P3),

        .empty_P0(empty_P0),
        .empty_P1(empty_P1),
        .empty_P2(empty_P2),
        .empty_P3(empty_P3),

        .pop_F0(pop_F0),
        .pop_F1(pop_F1),
        .pop_F2(pop_F2),
        .pop_F3(pop_F3),

        .push_F0(push_F0),
        .push_F1(push_F1),
        .push_F2(push_F2),
        .push_F3(push_F3),

        .in_FIFO_0(in_FIFO_0),
        .in_FIFO_1(in_FIFO_1),
        .in_FIFO_2(in_FIFO_2),
        .in_FIFO_3(in_FIFO_3),

        .out_FIFO_0(out_FIFO_0),
        .out_FIFO_1(out_FIFO_1),
        .out_FIFO_2(out_FIFO_2),
        .out_FIFO_3(out_FIFO_3));
    
endmodule
