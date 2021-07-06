
`include "Fifo.v"
`include "mux4x1.v"
`include "demux4x1.v"

module roundRobin(
            // Controles generales del arbitro
            
            input   clk, reset, 

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
            
            output pop_F0,
            output pop_F1,
            output pop_F2,
            output pop_F3,

            output push_F0,
            output push_F1,
            output push_F2,
            output push_F3,

            // Datos de salida y entrada de los fifos

            input [9:0] in_FIFO_0,
            input [9:0] in_FIFO_1,
            input [9:0] in_FIFO_2,
            input [9:0] in_FIFO_3,

            output [9:0] out_FIFO_0,
            output [9:0] out_FIFO_1,
            output [9:0] out_FIFO_2,
            output [9:0] out_FIFO_3);





//Fifo P_0(.clk(clk), .reset(reset), .full_fifo(full_fifo), .empty_fifo(empty_fifo), );

always @(posedge clk) begin
    if (reset == 0) begin
    
    end
end

endmodule