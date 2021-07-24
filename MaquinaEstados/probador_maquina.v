module probador_maquina(

    output reg clk,
    output reg reset,
    output reg init,

    //umbrales

    output reg   [2:0]           bajo,                   //umbral bajo
    output reg   [2:0]           alto,                   //umbral alto

    input  [3:0]        estado_actual,         //
    input [3:0]        sig_estado,

    output reg [7:0]             empty_fifos,

    input              active_out,
    input              next_active,
    input              idle_out,
    input              next_idle,

    input   [2:0]           bajo_out,                  
    input   [2:0]           alto_out,

    input   [2:0]           next_bajo,                  
    input   [2:0]           next_alto         
);


    initial begin

    $dumpfile("probmaq.vcd");
    $dumpvars();
    reset <= 1;
    init<=0;
    bajo<=000;
    alto<=110;
    empty_fifos=8'hFF;
    
    @(posedge clk);
    reset <= 0;
    init<=1;
    
    @(posedge clk);
    reset <= 0;
    init<=0;
    
    @(posedge clk);
    bajo<=000;
    alto<=110;

    @(posedge clk);
    
    bajo<=001;
    alto<=111;
    
    @(posedge clk);
   

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
    bajo<=001;
    alto<=111;
    init<=1;

    @(posedge clk);
    @(posedge clk);
    bajo<=000;
    alto<=110;

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