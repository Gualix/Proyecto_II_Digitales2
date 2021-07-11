module probador_memoria#(parameter data_width = 10,
						parameter address_width = 8)
						(output reg clk,  wrmem_enable, rdmem_enable, reset,
						output reg [data_width-1:0] memo_data_in,
			
						input [data_width-1:0] memo_data_out,
						input [data_width-1:0] memo_data_out_synth);

	initial begin
	$dumpfile("memoria.vcd");
	$dumpvars;

	{wrmem_enable, reset} <= 1;
	rdmem_enable <= 0;

	memo_data_in <= 0;

	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	wrmem_enable <= 1;
	
	reset <= 1'b0;
	memo_data_in <= 10'b0111000101;
	
	

	@(posedge clk);
	memo_data_in <= 10'b1111111111;
	

	@(posedge clk);
	memo_data_in <= 10'b1100001011;
	
	@(posedge clk);
	memo_data_in <= 10'b1101101100;
	

	@(posedge clk);
	memo_data_in <= 10'b110100001;
	

	@(posedge clk);
	memo_data_in <= 10'b1110010101;

	rdmem_enable <= 1;
	@(posedge clk);
	memo_data_in <= 10'b1110111111;
	

	@(posedge clk);
	memo_data_in <= 10'b1100000010;
	

	@(posedge clk);
	memo_data_in <= 10'b1101111001;
	
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