`include "mux4x1.v"
`include "probador_mux4x1.v"

module bancoMux4x1();

    wire clk;
    wire reset;
    wire [1:0] select;

	wire [9:0] FIFO_0;
	wire [9:0] FIFO_1;
	wire [9:0] FIFO_2;
	wire [9:0] FIFO_3;

	wire [9:0] muxOut;

	probador_mux4x1 test(
		.clk    (clk),
		.reset  (reset),
        .select (select),
        .FIFO_0 (FIFO_0),
        .FIFO_1 (FIFO_1),
        .FIFO_2 (FIFO_2),
        .FIFO_3 (FIFO_3),

        .muxOut (muxOut)
    );

    mux4x1 multiplexor(
        .clk    (clk),
		.reset  (reset),
        .select (select),
        .in_0   (FIFO_0),
        .in_1   (FIFO_1),
        .in_2   (FIFO_2),
        .in_3   (FIFO_3),

        .out_conductual (muxOut)
    );


	


endmodule
