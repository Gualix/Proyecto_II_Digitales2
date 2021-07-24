module probador_fifo#(parameter data_width = 10,
						parameter address_width = 8)
						(output reg clk,reset, 
						input wr_enable, rd_enable,wr_enable_synth, rd_enable_synth,
						output reg [data_width-1:0] FIFO_data_in,
						output reg pop, push, 
						output reg [2:0] alto, bajo,

						/*input [2:0] wr_ptr, rd_ptr,*/
						input [data_width-1:0] FIFO_data_out,
						input [data_width-1:0] FIFO_data_out_synth,
						
						input full_fifo,
   				        input empty_fifo,
            			input almost_empty_fifo,
            			input almost_full_fifo,
            			

						input full_fifo_synth,
   				        input empty_fifo_synth,
            			input almost_empty_fifo_synth,
            			input almost_full_fifo_synth
            			
						
						);


	initial begin
	$dumpfile("FifoPushPop.vcd");
	$dumpvars;

	//{wr_enable, rd_enable} <= 0;
	alto=111;
	bajo=000;
	reset <= 1;
	FIFO_data_in <= 0;
	clk<=0;
	pop<=0;
    @(posedge clk);
	push <= 1;
	
	reset <= 1;

	@(posedge clk);
	reset <= 0;
	FIFO_data_in <= 10'b0010010000;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	
	pop<=1;
	push <= 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
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