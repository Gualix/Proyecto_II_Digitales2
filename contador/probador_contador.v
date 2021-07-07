
module probador_contador
(
//*********************** SALIDAS ******************************//

    output reg       clk,                        //reloj
    output reg       reset,                      //reset
    output reg       [2:0] idx,                        //index
    output reg       req,                        //request
    output reg       [9:0]            data_in_0,  
    output reg       [9:0]            data_in_1,  
    output reg       [9:0]            data_in_2,  
    output reg       [9:0]            data_in_3,      
    //entrada datos del fifo
    output reg       IDLE,                       //activado para leer

//*********************** ENTRADAS ******************************//
    input                      valid_contador, //salida valid contador
    input  [4:0]               contador_out,

    input                      valid_contador_s, //salida valid contador
    input  [4:0]               contador_out_s  



);


initial begin
        $dumpfile("contador.vcd");
        $dumpvars();

    reset <= 1;
    data_in_0 <= 0;
    data_in_1 <= 0;
    data_in_2 <= 0;
    data_in_3 <= 0;

    @(posedge clk);

    reset <= 1;

    @(posedge clk);

    reset <= 1;

    @(posedge clk);

    reset <= 0;
    req   <= 0;
    IDLE  <=0;

    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 0;
    data_in_0 <= 00000;
    data_in_1 <= 00001;
    data_in_2 <= 00011;
    data_in_3 <= 00001;


    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 0;
    data_in_0 <= 00000;
    data_in_1 <= 00001;
    data_in_2 <= 00011;
    data_in_3 <= 00001;


     @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 1;
    data_in_0 <= 01000;
    data_in_1 <= 00001;
    data_in_2 <= 00000;
    data_in_3 <= 00000;
    
    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 1;
    data_in_0 <= 00001;
    data_in_1 <= 00001;
    data_in_2 <= 00000;
    data_in_3 <= 00001;

    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 2;
    data_in_0 <= 00111;
    data_in_1 <= 01110;
    data_in_2 <= 00011;
    data_in_3 <= 00001;

    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 3;
    data_in_0 <= 00001;
    data_in_1 <= 00001;
    data_in_2 <= 00011;
    data_in_3 <= 00001;
    

   

    @(posedge clk);


    @(posedge clk);


    @(posedge clk);

$finish;
    end
 initial clk <= 0;
 always #1 clk <= ~clk; 

endmodule