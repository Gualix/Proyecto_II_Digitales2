`include "contador.v"
`include "probador_contador.v"
`include "contador_s.v"
`include "cmos_cells.v"
module banco_contador;

    wire       clk;                        //reloj
    wire       reset;                      //reset
    wire       [1:0] idx;                        //index
    wire       req;                        //request
    wire       pop_F0;  
    wire       pop_F1;  
    wire       pop_F2;  
    wire       pop_F3;      
    wire       IDLE;                      //activado para leer

    wire                           valid_contador; //salida  valid_contador contador
    wire        [4:0]               contador_out;  //contador salida del index de interes

    wire                           valid_contador_s; //salida  valid_contador contador
    wire        [4:0]               contador_out_s;  //contador salida del index de interes
    wire        empty_P4;
    wire        empty_P5;
    wire        empty_P6;
    wire        empty_P7;



contador cont(
    /*AUTOINST*/
    .clk                (clk),           
    .reset              (reset),           
    .idx                (idx[1:0]),            
    .req                (req),          
    .pop_F0          (pop_F0),
    .pop_F1          (pop_F1),  
    .pop_F2          (pop_F2),     
    .pop_F3          (pop_F3),     
    .empty_P4        (empty_P4),
    .empty_P5        (empty_P5),
    .empty_P6        (empty_P6), 
    .empty_P7        (empty_P7),
    .IDLE            (IDLE),                      

    .valid_contador     (valid_contador), 
    .contador_out       (contador_out[4:0] )
);

probador_contador prob(

    /*AUTOINST*/
    .clk                (clk),           
    .reset              (reset),           
    .idx                (idx[1:0]),            
    .req                (req),          
    .pop_F0             (pop_F0),
    .pop_F1             (pop_F1),  
    .pop_F2             (pop_F2),     
    .pop_F3             (pop_F3),  
    .empty_P4           (empty_P4),
    .empty_P5           (empty_P5),
    .empty_P6           (empty_P6), 
    .empty_P7           (empty_P7),    
    .IDLE               (IDLE),                      

    .valid_contador                   (valid_contador), 
    .contador_out                     (contador_out[4:0] ),
    .valid_contador_s                 (valid_contador_s), 
    .contador_out_s                   (contador_out_s[4:0] )

);

contador_s cont_sintetizado (
    /*AUTOINST*/
    .clk                    (clk),           
    .reset                  (reset),           
    .idx                    (idx[1:0]),            
    .req                    (req),          
    .pop_F0              (pop_F0),
    .pop_F1              (pop_F1),  
    .pop_F2              (pop_F2),    
    .empty_P4           (empty_P4),
    .empty_P5           (empty_P5),
    .empty_P6           (empty_P6), 
    .empty_P7           (empty_P7), 
    .pop_F3                 (pop_F3),      
    .IDLE                   (IDLE),                      

    .valid_contador_s       ( valid_contador_s ), 
    .contador_out_s         ( contador_out_s[4:0])

);
endmodule
