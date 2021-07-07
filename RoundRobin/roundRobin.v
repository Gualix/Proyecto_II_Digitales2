
`include "Fifo.v"
`include "mux4x1.v"
`include "demux4x1.v"

module roundRobin(
    // Controles generales del arbitro
            
    input  clk, reset, 

    // Entradas de alimentación de los fifos

    input  almost_full_P0,
    input  almost_full_P1,
    input  almost_full_P2,
    input  almost_full_P3,

    input  empty_P0,
    input  empty_P1,
    input  empty_P2,
    input  empty_P3,

    // Salidas para el control de los Fifos
            
    output reg pop_F0,
    output reg pop_F1,
    output reg pop_F2,
    output reg pop_F3,

    output reg push_F0,
    output reg push_F1,
    output reg push_F2,
    output reg push_F3,

    // Datos de salida y entrada de los fifos

    input [9:0] in_FIFO_0,
    input [9:0] in_FIFO_1,
    input [9:0] in_FIFO_2,
    input [9:0] in_FIFO_3,

    output reg [9:0] out_FIFO_0,
    output reg [9:0] out_FIFO_1,
    output reg [9:0] out_FIFO_2,
    output reg [9:0] out_FIFO_3);

wire [9:0] data;

wire [9:0] out0_FIFO;
wire [9:0] out1_FIFO;
wire [9:0] out2_FIFO;
wire [9:0] out3_FIFO;

//Problema con el selector, debe guiarse por data
reg [1:0] select;

mux4x1 multiplexor(
        .clk    (clk),
		.reset  (reset),
        .select (select),
        .in_0   (in_FIFO_0),
        .in_1   (in_FIFO_1),
        .in_2   (in_FIFO_2),
        .in_3   (in_FIFO_3),

        .out_conductual (data));

demux4x1 demultiplexor(
        .clk    (clk),
		.reset  (reset),
        .select (select),

        .out_0   (out0_FIFO),
        .out_1   (out1_FIFO),
        .out_2   (out2_FIFO),
        .out_3   (out3_FIFO),

        .in_conductual (data));


always @(posedge clk) begin
    if (reset == 1) begin

        out_FIFO_0 <= out0_FIFO;
        out_FIFO_1 <= out1_FIFO;
        out_FIFO_2 <= out2_FIFO;
        out_FIFO_3 <= out3_FIFO;

        //Revisa las entradas para vaciarlos
        if (empty_P0 == 0) begin
            pop_F0 <= 1;
            pop_F1 <= 0;
            pop_F2 <= 0;
            pop_F3 <= 0;
        end 
        else if (empty_P1 == 0) begin
            pop_F0 <= 0;
            pop_F1 <= 1;
            pop_F2 <= 0;
            pop_F3 <= 0;
        end
        else if (empty_P2 == 0) begin
            pop_F0 <= 0;
            pop_F1 <= 0;
            pop_F2 <= 1;
            pop_F3 <= 0;
        end
        else if (empty_P3 == 0) begin
            pop_F0 <= 0;
            pop_F1 <= 0;
            pop_F2 <= 0;
            pop_F3 <= 1;
        end
    end
end

endmodule