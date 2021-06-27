module probador_memoria#(parameter data_width = 10,
						parameter address_width = 8)
						(output reg clk, wr_enable, rd_enable, reset,
						output reg [data_width-1:0] FIFO_data_in,
						output reg [address_width-1:0] wr_ptr, rd_ptr,
						input [data_width-1:0] FIFO_data_out,
						input [data_width-1:0] FIFO_data_out_synth);

	initial begin
	$dumpfile("memoria.vcd");
	$dumpvars;

	{wr_enable, rd_enable, reset} <= 0;
	{rd_ptr, wr_ptr} <= 0;
	FIFO_data_in <= 0;

	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	wr_enable <= 1;
	rd_enable <= 1;
	reset <= 1'b1;
	FIFO_data_in <= 10'b0111000101;
	wr_ptr <= 8'b01001000;
	

	@(posedge clk);
	FIFO_data_in <= 10'b1111111111;
	wr_ptr <= 8'b01001001;
	rd_ptr <= 8'b01001000;

	@(posedge clk);
	FIFO_data_in <= 10'b1100001011;
	wr_ptr <= 8'b01001010;

	@(posedge clk);
	FIFO_data_in <= 10'b1101101100;
	wr_ptr <= 8'b01001011;

	@(posedge clk);
	FIFO_data_in <= 10'b110100001;
	wr_ptr <= 8'b01001100;

	@(posedge clk);
	FIFO_data_in <= 10'b1110010101;
	wr_ptr <= 8'b01001101;

	@(posedge clk);
	FIFO_data_in <= 10'b1110111111;
	wr_ptr <= 8'b01001110;

	@(posedge clk);
	FIFO_data_in <= 10'b1100000010;
	wr_ptr <= 8'b01001111;

	@(posedge clk);
	FIFO_data_in <= 10'b1101111001;
	wr_ptr <= 8'b01001000;


	$finish;
	end
	initial clk <= 1;
	always #1 clk <= ~clk;
endmodule