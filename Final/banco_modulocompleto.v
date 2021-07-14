`include "ModuloCompleto.v"
`include "probador.v"


module banco_modulocompleto();

	parameter address_width = 8;
	parameter data_width = 10;

    //Wires
    wire clk,reset, init;

    //Entradas a los Fifos
	wire [data_width-1:0] FIFO_data_in0,FIFO_data_in1,FIFO_data_in2,FIFO_data_in3;
	//Salidas de los Fifos
    wire [data_width-1:0] FIFO_data_out4,FIFO_data_out5,FIFO_data_out6,FIFO_data_out7;
	//Pops y pushes
    wire pop4, pop5, pop6, pop7;
	wire push0, push1,push2, push3;
    //Al arbitro
    wire [1:0] idx; 
    wire req, IDLE;
    
    
    //Entradas de los umbrales de la maquina de estados
    wire [2:0] alto,bajo;

    //Estados
    wire [3:0] sig_estado, estado_actual;




    ModuloCompleto modulo(/*AUTOINST*/
        .clk(clk),
        //Entradas a la maquina de estados
        .reset(reset),
        .init(init),
        .alto(alto),
        .bajo(bajo),

        //Entradas desde el probador
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

        //Al contador
        .idx(idx),                        //index
        .req(req),                        //request
        .IDLE(IDLE),


        //Salidas de los fifos
        .FIFO_data_out4(FIFO_data_out4),
        .FIFO_data_out5(FIFO_data_out5),
        .FIFO_data_out6(FIFO_data_out6),
        .FIFO_data_out7(FIFO_data_out7),


        //Maquina de estados
        .estado_actual(estado_actual),
        .sig_estado(sig_estado)




    );



    probador probador_modulo(/*AUTOINST*/
            .clk(clk),
        //Entradas a la maquina de estados
        .reset(reset),
        .init(init),
        .alto(alto),
        .bajo(bajo),

        //Entradas desde el probador
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


        //Salidas de los fifos
        .FIFO_data_out4(FIFO_data_out4),
        .FIFO_data_out5(FIFO_data_out5),
        .FIFO_data_out6(FIFO_data_out6),
        .FIFO_data_out7(FIFO_data_out7),

        .idx(idx),                        //index
        .req(req),                        //request
        .IDLE(IDLE)





    );




endmodule