
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
    output reg  empty_P4,
    output reg  empty_P5,
    output reg  empty_P6,
    output reg  empty_P7,

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


    input pop_F0_sint,
    input pop_F1_sint,
    input pop_F2_sint,
    input pop_F3_sint,

    input push_F0_sint,
    input push_F1_sint,
    input push_F2_sint,
    input push_F3_sint
    );


	initial begin
	$dumpfile("roundRobin.vcd");
	$dumpvars;

	clk <= 0;   
	reset <= 1;

    almost_full_P0<=0;
    almost_full_P1<=0;
    almost_full_P2<=0;
    almost_full_P3<=0;


    empty_P0 <= 0;
    empty_P1 <= 0;
    empty_P2 <= 0;
    empty_P3 <= 0;

    @(posedge clk);
	reset <= 0;

    

    empty_P0 <= 0;
    empty_P1 <= 0;
    empty_P2 <= 0;
    empty_P3 <= 0;
    @(posedge clk);
    empty_P0 <= 1;
    empty_P1 <= 0;
    empty_P2 <= 0;
    empty_P3 <= 0;    
	@(posedge clk);
    empty_P0 <= 1;
    empty_P1 <= 1;
    empty_P2 <= 0;
    empty_P3 <= 0; 

	@(posedge clk);
    empty_P0 <= 1;
    empty_P1 <= 1;
    empty_P2 <= 1;
    empty_P3 <= 0;     
	@(posedge clk);
    empty_P0 <= 1;
    empty_P1 <= 1;
    empty_P2 <= 1;
    empty_P3 <= 1;     
    @(posedge clk);

    empty_P0 <= 0;
    empty_P1 <= 0;
    empty_P2 <= 0;
    empty_P3 <= 0;
    @(posedge clk);

	@(posedge clk);
	reset  <= 0;


    empty_P0 <= 0;
    empty_P1 <= 0;
    empty_P2 <= 0;
    empty_P3 <= 0;
    empty_P4 <= 0;
    empty_P5 <= 0;
    empty_P6 <= 0;
    empty_P7 <= 0;

	@(posedge clk);
	reset  <= 0;
	@(posedge clk);
    almost_full_P0<=1;
    almost_full_P1<=0;
    almost_full_P2<=0;
    almost_full_P3<=0;
	@(posedge clk);
    almost_full_P0<=0;
    almost_full_P1<=1;
    almost_full_P2<=0;
    almost_full_P3<=0;
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