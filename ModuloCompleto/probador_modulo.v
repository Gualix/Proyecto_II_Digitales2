module probador_modulo#(parameter data_width = 10,
						parameter address_width = 8)
						(output reg clk,reset, 
						output reg [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3,
                        output reg push0, push1,push2, push3,
                        output reg pop4, pop5, pop6, pop7,
						output reg [2:0] alto, bajo,

						//Para el arbitro
						output reg req,IDLE,
						output reg [1:0] idx,



						input valid_contador,
						input [4:0] contador_out,

						//Fin de arbitro
                        input [7:0] empty_fifos,
						input [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7
						//input [data_width-1:0] FIFO_data_out_synth
						);


	initial begin
	$dumpfile("ModuloTEst.vcd");
	$dumpvars;

	req<=1;
	IDLE<=1;
	alto=110;
	bajo=001;
	reset <= 1;
	FIFO_data_in0 <= 0;
	clk<=0;
	pop4<=0;
    pop5<=0;
    pop6<=0;
    pop7<=0;
    @(posedge clk);
	push0 <= 1;
	push1 <= 1;
    push2 <= 1;
	push3 <= 1;
	reset <= 1;

	@(posedge clk);
	reset <= 0;
	FIFO_data_in0 <= 10'b0010010000;
	FIFO_data_in1 <= 10'b1000000000;
	FIFO_data_in2 <= 10'b1010010000;
	FIFO_data_in3 <= 10'b1110010000;
	idx<=00;
	repeat (10) begin
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	FIFO_data_in1 <= FIFO_data_in1+3;
	
	FIFO_data_in2 <= FIFO_data_in2+4;
	FIFO_data_in3 <= FIFO_data_in3+5;
	idx<=idx+1;
	end
	push0 <= 0;
	push1 <= 0;
    push2 <= 0;
	push3 <= 0;

	pop4 <= 1;
	pop5 <= 1;
    pop6 <= 1;
	pop7 <= 1;
	repeat (10) begin
	@(posedge clk);
	FIFO_data_in0 <= FIFO_data_in0+1;
	FIFO_data_in1 <= FIFO_data_in1+3;
	
	FIFO_data_in2 <= FIFO_data_in2+4;
	FIFO_data_in3 <= FIFO_data_in3+5;
	idx<=idx+1;
	end
	@(posedge clk);
	push0 <= 0;
	push1 <= 0;
    push2 <= 0;
	push3 <= 0;

	pop4 <= 1;
	pop5 <= 1;
    pop6 <= 1;
	pop7 <= 1;
	idx<=idx+1;
	/*
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
*/


	@(posedge clk);
	idx<=idx+1;
	@(posedge clk);
	idx<=idx+1;
	@(posedge clk);
	idx<=idx+1;
	@(posedge clk);
	idx<=idx+1;
	@(posedge clk);
	idx<=idx+1;
	@(posedge clk);
	idx<=idx+1;
	@(posedge clk);
	idx<=idx+1;
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