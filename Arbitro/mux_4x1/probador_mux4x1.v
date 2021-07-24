
module probador_mux4x1(
    output reg clk, reset, 

	input  [9:0] muxOut, 
    output reg [1:0] select,

    output reg [9:0] FIFO_0,
    output reg [9:0] FIFO_1,
    output reg [9:0] FIFO_2,
    output reg [9:0] FIFO_3);


	initial begin
	$dumpfile("mux_4x1.vcd");
	$dumpvars;

	clk<=0;
	reset <= 1;
	FIFO_0 <= 10'b0000000000;
	FIFO_1 <= 10'b0000000000;
	FIFO_2 <= 10'b0000000000;
	FIFO_3 <= 10'b0000000000;
    select <= 2'b00;
	
    @(posedge clk);
	reset <= 1;

	@(posedge clk);
	reset  <= 0;
	FIFO_0 <= 10'b1111000000;
	FIFO_1 <= 10'b0011100100;
	FIFO_2 <= 10'b1100011011;
	FIFO_3 <= 10'b1011100111;
    select <= 2'b01;
	@(posedge clk);
	reset  <= 1;
	FIFO_0 <= 10'b1111000000;
	FIFO_1 <= 10'b0011100100;
	FIFO_2 <= 10'b1100011011;
	FIFO_3 <= 10'b1011100111;
    select <= 2'b01;
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