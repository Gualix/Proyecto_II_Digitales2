module probador_maquina(

    output reg clk,
    output reg reset,
    output reg init,

    //umbrales

    output reg   [7:0]           bajo,                   //umbral bajo
    output reg   [7:0]           alto,                   //umbral alto

    output reg [3:0]        estado_actual,         //
    output reg [3:0]        sig_estado,

    output reg [7:0]             empty_fifos,

    input              active_out,
    input              next_active,
    input              idle_out,
    input              next_idle,

    input   [7:0]           bajo_out,                  
    input   [7:0]           alto_out,

    input   [7:0]           next_bajo,                  
    input   [7:0]           next_alto         
);


    initial begin

    $dumpfile("probmaq.vcd");
    $dumpvars();
    reset <= 0;
    init<=0;
    bajo<=0000;
    alto<=0000;
    empty_fifos[0] <= 0;
    empty_fifos[1] <= 0;
    empty_fifos[2] <= 0;
    empty_fifos[3] <= 0;
    empty_fifos[4] <= 0;
    empty_fifos[5] <= 0;
    empty_fifos[6] <= 0;
    empty_fifos[7] <= 0;
    empty_fifos[8] <= 0;
    
    @(posedge clk);
    reset <= 0;
    
    @(posedge clk);
    reset <= 1;
    
    @(posedge clk);
    bajo<=00111000;
    alto<=01110000;

    @(posedge clk);
    init<=1;
    bajo<=00111110;
    alto<=01110010;
    
    @(posedge clk);
    init<=1;

    @(posedge clk);
    @(posedge clk);
    
    @(posedge clk);
    empty_fifos[0] <= 0;
    empty_fifos[1] <= 0;
    empty_fifos[2] <= 0;
    empty_fifos[3] <= 0;
    empty_fifos[4] <= 0;
    empty_fifos[5] <= 0;
    empty_fifos[6] <= 0;
    empty_fifos[7] <= 0;
    empty_fifos[8] <= 0;

    @(posedge clk);
    @(posedge clk);
    bajo<=00111000;
    alto<=01110000;


    @(posedge clk);
    @(posedge clk);
    bajo<=00111000;
    alto<=01110000;

    @(posedge clk);
    @(posedge clk);
    reset <= 0;
    @(posedge clk);
    @(posedge clk);
    $finish;
  end

  initial clk <= 0;
  always #1 clk <= ~clk;
endmodule