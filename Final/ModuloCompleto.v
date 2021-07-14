`include "conexion.v"
`include "maquina_de_estados.v"


module ModuloCompleto(
    input clk,
    input reset,
/*Inputs*/
    //Para la maquina de estados
    input init,
    input [2:0] alto,bajo,
    //Para el probador de abajo
    input [9:0] FIFO_data_in0,
    input [9:0] FIFO_data_in1,
    input [9:0] FIFO_data_in2,
    input [9:0] FIFO_data_in3,
    input push0,
    input push1,
    input push2,
    input push3, 


    //Para el probador de arriba
    input pop4,
    input pop5,
    input pop6,
    input pop7,

    //Para el contador
    input       [1:0] idx,                        //index
    input       req,                        //request
    output IDLE,




    //Outputs de los fifos
    output  [9:0] FIFO_data_out4,
    output  [9:0] FIFO_data_out5,
    output  [9:0] FIFO_data_out6,
    output  [9:0] FIFO_data_out7,


    //Output del contador 
    output    valid_contador, //salida  valid_contador contador
    output  [4:0] contador_out, //contador salida del index de interes


    //Outputs de la maquina de estados
    output  [3:0] estado_actual,
    output  [3:0] sig_estado




);

wire [2:0] alto_out, bajo_out;
wire    [7:0] empty_fifos;


conexion conexion_final(

    //Inputs
    .clk(clk),
    .reset(reset),
    .FIFO_data_in0(FIFO_data_in0),
    .FIFO_data_in1(FIFO_data_in1),
    .FIFO_data_in2(FIFO_data_in2),
    .FIFO_data_in3(FIFO_data_in3),


    .push0(push0),
    .push1(push1),
    .push2(push2),
    .push3(push3),


    .pop4(pop4),
    .pop5(pop5),
    .pop6(pop6),
    .pop7(pop7),

    .alto(alto_out),
    .bajo(bajo_out),


    //Inputs del contador//
    .idx(idx),
    .req(req),
    .IDLE(IDLE),


    //Outputs
    //Salidas de los fifos
    .FIFO_data_out4(FIFO_data_out4),
    .FIFO_data_out5(FIFO_data_out5),
    .FIFO_data_out6(FIFO_data_out6),
    .FIFO_data_out7(FIFO_data_out7),
    .empty_fifos(empty_fifos),

    //Salida del contador 
    .valid_contador(valid_contador),
    .contador_out(contador_out)



);

maquina_de_estados maquina(
    .clk(clk),
    .reset(reset),
    .init(init),

    //umbrales

    .bajo(bajo),                   //umbral bajo
    .alto(alto),                   //umbral alto

    .estado_actual(estado_actual),         //
    .sig_estado(sig_estado),

    .empty_fifos(empty_fifos),

    .active_out(active_out),
  
    .idle_out(IDLE),
 

    .bajo_out(bajo_out),                  
    .alto_out(alto_out)



);

endmodule