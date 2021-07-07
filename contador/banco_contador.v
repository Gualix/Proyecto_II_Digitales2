`include "contador.v"
`include "probador_contador.v"
`include "contador_s.v"
`include "cmos_cells.v"
module banco_contador;

    wire       clk;                        //reloj
    wire       reset;                      //reset
    wire       [2:0] idx;                        //index
    wire       req;                        //request
    wire       [9:0]               data_in_0;  
    wire       [9:0]               data_in_1;  
    wire       [9:0]               data_in_2;  
    wire       [9:0]               data_in_3;      
    wire       IDLE;                      //activado para leer

    wire                           valid_contador; //salida  valid_contador contador
    wire       [4:0]               contador_out;  //contador salida del index de interes

    wire                           valid_contador_s; //salida  valid_contador contador
    wire       [4:0]               contador_out_s;  //contador salida del index de interes



contador cont
(
    /*AUTOINST*/
    .clk               (clk),           
    .reset             (reset),           
    .idx               (idx[2:0]),            
    .req               (req),          
    .data_in_0          (data_in_0[9:0]),
    .data_in_1          (data_in_1[9:0]),  
    .data_in_2          (data_in_2[9:0]),     
    .data_in_3          (data_in_3[9:0]),      
    .IDLE               (IDLE),                      

    .valid_contador     (valid_contador), 
    .contador_out      (contador_out[4:0] )
);

probador_contador prob(

    /*AUTOINST*/
    .clk               (clk),           
    .reset             (reset),           
    .idx               (idx[2:0]),            
    .req               (req),          
    .data_in_0          (data_in_0[9:0]),
    .data_in_1          (data_in_1[9:0]),  
    .data_in_2          (data_in_2[9:0]),     
    .data_in_3          (data_in_3[9:0]),      
    .IDLE               (IDLE),                      

    .valid_contador                   (valid_contador), 
    .contador_out                     (contador_out[4:0] ),
    .valid_contador_s       (valid_contador_s), 
    .contador_out_s         (contador_out_s[4:0] )

);

contador_s cont_sintetizado (
    /*AUTOINST*/
    .clk                    (clk),           
    .reset                  (reset),           
    .idx                    (idx[2:0]),            
    .req                    (req),          
    .data_in_0              (data_in_0[9:0]),
    .data_in_1              (data_in_1[9:0]),  
    .data_in_2              (data_in_2[9:0]),     
    .data_in_3              (data_in_3[9:0]),      
    .IDLE                   (IDLE),                      

    .valid_contador_s       ( valid_contador_s ), 
    .contador_out_s         ( contador_out_s[4:0])

);
endmodule
