`include "mux4x1.v"
`include "demux4x1.v"
`include "Fifo.v"
`include "arbitro.v"
`include "contador.v"

module conexion#(parameter data_width = 10,
			    parameter address_width = 8)
                (
                input clk,
                input reset,
                input [2:0] alto,bajo,

                

                //Contador
                input       [1:0] idx,                        //index
                input       req,                        //request
                input IDLE,

                output    valid_contador, //salida  valid_contador contador
                output  [4:0] contador_out, //contador salida del index de interes


                //Para el arbitro
                input pop4,
                input pop5,
                input pop6,
                input pop7,

                input push0,
                input push1,
                input push2,
                input push3,

                input [data_width-1:0] FIFO_data_in0,
                input [data_width-1:0] FIFO_data_in1,
                input [data_width-1:0] FIFO_data_in2,
                input [data_width-1:0] FIFO_data_in3,

                output reg [7:0] empty_fifos,

                output  [data_width-1:0] FIFO_data_out4,
                output  [data_width-1:0] FIFO_data_out5,
                output  [data_width-1:0] FIFO_data_out6,
                output  [data_width-1:0] FIFO_data_out7
                
                /*
                input [data_width-1:0] FIFO_data_in4,
                input [data_width-1:0] FIFO_data_in5,
                input [data_width-1:0] FIFO_data_in6,
                input [data_width-1:0] FIFO_data_in7,*/
                /* output  [data_width-1:0] FIFO_data_out0,
                output  [data_width-1:0] FIFO_data_out1,
                output  [data_width-1:0] FIFO_data_out2,
                output [data_width-1:0] FIFO_data_out3,*/

);

wire [1:0] select;
wire [9:0] out_mux;
wire pop0, pop1, pop2, pop3;
wire push4, push5, push6, push7;
wire empty_P0,empty_P1, empty_P2, empty_P3;

wire empty_P4,empty_P5, empty_P6, empty_P7;
wire almost_full_P0, almost_full_P1, almost_full_P2, almost_full_P3;


wire [data_width-1:0] FIFO_data_out0, FIFO_data_out1, FIFO_data_out2, FIFO_data_out3;
wire [data_width-1:0] FIFO_data_in4, FIFO_data_in5, FIFO_data_in6, FIFO_data_in7;

contador cont(

    //input
    .clk(clk),
    .reset(reset),
    .idx (idx [1:0]),
    .req (req),
    .pop_F0 (pop0),
    .pop_F1 (pop1),
    .pop_F2 (pop2),
    .pop_F3 (pop3),

    .IDLE (IDLE),

    //outputs
    .valid_contador (valid_contador),
    .contador_out   (contador_out [4:0])


);

/*FIFOS de entrada*/
Fifo fifo0(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in0[data_width-1:0]),
    .pop(pop_F0),
    .push(push0),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out0[data_width-1:0]),
    .empty_fifo(empty_P0)

);

Fifo fifo1(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in1[data_width-1:0]),
    .pop(pop_F1),
    .push(push1),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out1[data_width-1:0]),
    .empty_fifo(empty_P1)

);


Fifo fifo2(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in2[data_width-1:0]),
    .pop(pop_F2),
    .push(push2),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out2[data_width-1:0]),
    .empty_fifo(empty_P2)

    
);


Fifo fifo3(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in3[data_width-1:0]),
    .pop(pop_F3),
    .push(push3),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out3[data_width-1:0]),
    .empty_fifo(empty_P3)

);


/*Muxes*/
mux4x1 mux(
        .in_0(FIFO_data_out0[data_width-1:0]),
        .in_1(FIFO_data_out1[data_width-1:0]),
        .in_2(FIFO_data_out2[data_width-1:0]),
        .in_3(FIFO_data_out3[data_width-1:0]),
        .select(select[1:0]),
        .reset(reset),
        .clk(clk),
        .out_mux(out_mux[data_width-1:0])

);

/*Demuxes*/
demux4x1 demux(
    .clk(clk),
    .reset(reset),
    .in_demux(out_mux[data_width-1:0]),
    .select(out_mux[9:8]),
    .out_0(FIFO_data_in4[data_width-1:0]),
    .out_1(FIFO_data_in5[data_width-1:0]),
    .out_2(FIFO_data_in6[data_width-1:0]),
    .out_3(FIFO_data_in7[data_width-1:0])
    
);



/*Fifos de salida */

Fifo fifo4(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in4[data_width-1:0]),
    .pop(pop4),
    .push(push_F0),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out4[data_width-1:0]),
    .empty_fifo(empty_P4),
    .almost_full_fifo(almost_full_P0)

);

Fifo fifo5(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in5[data_width-1:0]),
    .pop(pop5),
    .push(push_F1),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out5[data_width-1:0]),
    .empty_fifo(empty_P5),
    .almost_full_fifo(almost_full_P1)

    
);

Fifo fifo6(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in6[data_width-1:0]),
    .pop(pop6),
    .push(push_F2),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out6[data_width-1:0]),
    .empty_fifo(empty_P6),
    .almost_full_fifo(almost_full_P2)

    
);


Fifo fifo7(
    /*input*/
    .clk(clk),
    .reset(reset),
    .FIFO_data_in(FIFO_data_in7[data_width-1:0]),
    .pop(pop7),
    .push(push_F3),
    .alto(alto),
    .bajo(bajo),
    /*outputs*/
    .FIFO_data_out(FIFO_data_out7[data_width-1:0]),
    .empty_fifo(empty_P7),
    .almost_full_fifo(almost_full_P3)
    
);

/*Arbitro*/
arbitro Arbitro2( 
            .almost_full_P0(almost_full_P0),
            .almost_full_P1(almost_full_P1),
            .almost_full_P2(almost_full_P2),
            .almost_full_P3(almost_full_P3),
            .empty_P0(empty_P0),
            .empty_P1(empty_P1),
            .empty_P2(empty_P2),
            .empty_P3(empty_P3),
            .reset(reset),
            .clk(clk),
            
            /*Salidas*/

            .pop_F0(pop_F0),
            .pop_F1(pop_F1),
            .pop_F2(pop_F2),
            .pop_F3(pop_F3),

            .push_F0(push_F0),
            .push_F1(push_F1),
            .push_F2(push_F2),
            .push_F3(push_F3),

            .select(select[1:0])

);


/*Llenado de los empty fifos

Se llena los empty_fifos para la maquina de Estados*/

    always @(*)begin
        empty_fifos[0]=empty_P0;
        empty_fifos[1]=empty_P1;
        empty_fifos[2]=empty_P2;
        empty_fifos[3]=empty_P3;
        empty_fifos[4]=empty_P4;
        empty_fifos[5]=empty_P5;
        empty_fifos[6]=empty_P6;
        empty_fifos[7]=empty_P7;
        
       
    end









endmodule