
module probador_contador
(
//*********************** SALIDAS ******************************//

    output reg       clk,                        //reloj
    output reg       reset,                      //reset
    output reg       [1:0] idx,                        //index
    output reg       req,                        //request
    output reg       pop_F0,  
    output reg       pop_F1,  
    output reg       pop_F2,  
    output reg       pop_F3,      
    //entrada datos del fifo
    output reg       IDLE,                      //activado para leer

//*********************** SALIDAS ******************************//
    input                          valid_contador, //salida  valid_contador contador
    input  [4:0]                   contador_out,
    input                          valid_contador_s,
    input  [4:0]                   contador_out_s



);


initial begin
        $dumpfile("contador.vcd");
        $dumpvars();

    reset <= 1;
    pop_F0 <= 0;
    pop_F1 <= 0;
    pop_F2 <= 0;
    pop_F3 <= 0;

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
    pop_F0 <= 00000;
    pop_F1 <= 00001;
    pop_F2 <= 00011;
    pop_F3 <= 00001;


    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 0;
    pop_F0 <= 00000;
    pop_F1 <= 00001;
    pop_F2 <= 00011;
    pop_F3 <= 00001;


     @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 1;
    pop_F0 <= 01000;
    pop_F1 <= 00001;
    pop_F2 <= 00000;
    pop_F3 <= 00000;
    
    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 1;
    pop_F0 <= 00001;
    pop_F1 <= 00001;
    pop_F2 <= 00000;
    pop_F3 <= 00001;

    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 2;
    pop_F0 <= 00111;
    pop_F1 <= 01110;
    pop_F2 <= 00011;
    pop_F3 <= 00001;

    @(posedge clk);
    reset <= 0;
    req   <= 1;
    IDLE  <= 1;
    idx   <= 3;
    pop_F0 <= 00001;
    pop_F1 <= 00001;
    pop_F2 <= 00011;
    pop_F3 <= 00001;
    

   

    @(posedge clk);


    @(posedge clk);


    @(posedge clk);

$finish;
    end
 initial clk <= 0;
 always #1 clk <= ~clk; 

endmodule