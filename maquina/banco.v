`include "probador_maquina.v"
`include "maquina_de_estados.v"

module banco();

    wire clk;
    wire reset;
    wire init;

    //umbrales

    wire   [2:0]           bajo;                   //umbral bajo
    wire   [2:0]           alto;                   //umbral alto

    wire [3:0]        estado_actual;         //
    wire [3:0]        sig_estado;

    wire [7:0]             empty_fifos;

    wire              active_out;
    wire              next_active;
    wire              idle_out;
    wire              next_idle;

    wire   [7:0]           bajo_out;                  
    wire   [7:0]           alto_out;

    wire   [7:0]           next_bajo;                  
    wire   [7:0]           next_alto;

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