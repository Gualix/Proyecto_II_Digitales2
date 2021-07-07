
module probador_roundRobin(

	output reg  clk, reset, 

    // Entradas de alimentación de los fifos

    output reg  almost_full_P0,
    output reg  almost_full_P1,
    output reg  almost_full_P2,
    output reg  almost_full_P3,

    output reg  empty_P0,
    output reg  empty_P1,
    output reg  empty_P2,
    output reg  empty_P3,

    // Salidas para el control de los Fifos
            
    input pop_F0,
    input pop_F1,
    input pop_F2,
    input pop_F3,

    input push_F0,
    input push_F1,
    input push_F2,
    input push_F3,

    // Datos de salida y entrada de los fifos

    output reg [9:0] in_FIFO_0,
    output reg [9:0] in_FIFO_1,
    output reg [9:0] in_FIFO_2,
    output reg [9:0] in_FIFO_3,

    input [9:0] out_FIFO_0,
    input [9:0] out_FIFO_1,
    input [9:0] out_FIFO_2,
    input [9:0] out_FIFO_3);


	initial begin
	$dumpfile("roundRobin.vcd");
	$dumpvars;

	clk<=0;
	reset <= 1;

    @(posedge clk);
	reset <= 1;

	@(posedge clk);
	reset  <= 1;

	@(posedge clk);
	reset  <= 1;
	@(posedge clk);

	@(posedge clk);

	@(posedge clk);


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