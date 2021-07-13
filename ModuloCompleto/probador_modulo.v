module probador_modulo#(parameter data_width = 10,
						parameter address_width = 8)
						(output reg clk,reset, 
						output reg [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3,
                        output reg push0, push1,push2, push3,
                        output reg pop0, pop1, pop2, pop3,

                        input [7:0] empty_fifos,
						input [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7
						//input [data_width-1:0] FIFO_data_out_synth
						);


	initial begin
	$dumpfile("ModuloTEst.vcd");
	$dumpvars;


	reset <= 1;
	FIFO_data_in0 <= 0;
	clk<=0;
	pop0<=1;
    pop1<=1;
    pop2<=1;
    pop3<=1;
    @(posedge clk);
	push0 <= 1;
	push1 <= 1;
    push2 <= 1;
	push3 <= 1;
	reset <= 1;

	@(posedge clk);
	reset <= 0;
	FIFO_data_in0 <= 10'b0010010000;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
    @(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;

    @(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;

    @(posedge clk);
	FIFO_data_in1 <= FIFO_data_in1+1;
	@(posedge clk);
	FIFO_data_in1 <= FIFO_data_in1+1;
	@(posedge clk);
	FIFO_data_in1 <= FIFO_data_in1+1;



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
	
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	/*
    //wr_enable <= 1;

	
	FIFO_data_in <= 10'b0010010000;
	@(posedge clk);

	@(posedge clk);
	//rd_enable<=1;
	FIFO_data_in <= FIFO_data_in+1;
		@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
		@(posedge clk);
	FIFO_data_in <= FIFO_data_in+1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);		
    @(posedge clk);
	@(posedge clk);*/
	$finish;
	end
	initial clk <= 1;
	always #1 clk <= ~clk;
endmodule