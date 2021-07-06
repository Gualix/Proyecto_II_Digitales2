`include "demux4x1.v"
`include "probador_demux4x1.v"

module bancoDemux4x1();

    wire clk;
    wire reset;
    wire [1:0] select;

	wire [9:0] FIFO_0;
	wire [9:0] FIFO_1;
	wire [9:0] FIFO_2;
	wire [9:0] FIFO_3;

	wire [9:0] demuxIn;

	probador_demux4x1 test(
		.clk    (clk),
		.reset  (reset),
        .select (select),
        
        .FIFO_0 (FIFO_0),
        .FIFO_1 (FIFO_1),
        .FIFO_2 (FIFO_2),
        .FIFO_3 (FIFO_3),

        .demuxIn (demuxIn)
    );

    demux4x1 demultiplexor(
        .clk    (clk),
		.reset  (reset),
        .select (select),

        .out_0   (FIFO_0),
        .out_1   (FIFO_1),
        .out_2   (FIFO_2),
        .out_3   (FIFO_3),

        .in_conductual (demuxIn)
    );


	


endmodule
