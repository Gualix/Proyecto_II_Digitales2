`include "probador_maquina.v"
`include "maquina_de_estados.v"

module banco();

    wire       clk;                        //reloj
    wire       reset;                      //reset
    wire       [1:0] idx;                        //index
    wire       req;                        //request
    wire       pop_F0;  
    wire       pop_F1;  
    wire       pop_F2;  
    wire       pop_F3;      
    //entrada datos del fifo
    wire       IDLE;                      //activado para leer
    wire       empty_P4;
    wire       empty_P5;
    wire       empty_P6;
    wire       empty_P7;

//*********************** SALIDAS ******************************//
    wire                   valid_contador; //salida  valid_contador contador
    wire                   contador_out;
    wire                   valid_contador_s;
    wire                   contador_out_s;

maquina_de_estados maq(/*AUTOINST*/

    .clk                (clk),
    .reset              (reset),
    .init               (init),

    //umbrales

    .bajo               (bajo),                   //umbral bajo
    .alto               (alto),                   //umbral alto

    .estado_actual      (estado_actual),         //
    .sig_estado         (sig_estado),

    .empty_fifos        (empty_fifos [7:0]),

    .active_out         (active_out),
    .next_active        (next_active),
    .idle_out           (idle_out),
    .next_idle          (next_idle),

    .bajo_out           (bajo_out),                  
    .alto_out           (alto_out),

    .next_bajo          (next_bajo),                  
    .next_alto          (next_alto)    
);

probador_maquina maqprob(/*AUTOINST*/

    .clk                (clk),
    .reset              (reset),
    .init               (init),

    //umbrales

    .bajo               (bajo),                   //umbral bajo
    .alto               (alto),                   //umbral alto

    .estado_actual      (estado_actual),         //
    .sig_estado         (sig_estado),

    .empty_fifos        (empty_fifos [7:0]),

    .active_out         (active_out),
    .next_active        (next_active),
    .idle_out           (idle_out),
    .next_idle          (next_idle),

    .bajo_out           (bajo_out),                  
    .alto_out           (alto_out),

    .next_bajo          (next_bajo),                  
    .next_alto          (next_alto)    

);

endmodule