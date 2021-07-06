
module probador_demux4x1(
	input 	[9:0] FIFO_0,
    input 	[9:0] FIFO_1,
    input 	[9:0] FIFO_2,
    input 	[9:0] FIFO_3,
	
    output reg clk, reset, 
	output reg [9:0] demuxIn,
	output reg  [1:0] select);


	initial begin
	$dumpfile("demux_4x1.vcd");
	$dumpvars;

	clk<=0;
	reset <= 1;
	demuxIn <= 10'b1011001100;
    select <= 2'b00;

    @(posedge clk);
	reset <= 1;
	demuxIn <= 10'b1000000001;
    select <= 2'b01;
	@(posedge clk);
	reset  <= 0;
	demuxIn <= 10'b1000000001;
    select <= 2'b10;
	@(posedge clk);
	reset   <= 1;
	demuxIn <= 10'b1001111001;
    select  <= 2'b11;
	@(posedge clk);
	select <= 2'b10;
	@(posedge clk);
	select <= 2'b00;
	@(posedge clk);
	select <= 2'b11;

    // Relleno de tiempo para analizar la senal
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);

	$finish;
	end
	initial clk <= 1;
	always #1 clk <= ~clk;
endmodule