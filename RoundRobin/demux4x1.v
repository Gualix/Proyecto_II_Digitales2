
/* ------------------------------------------  
Demultiplexor que genera 4 salidas y tiene una entrada en 10 bits, 
para ser utilizados en el roundRobin del proyecto 2
------------------------------------------ */

module demux4x1 (
        input clk,
        input reset,
        input [1:0] select,
        input [9:0] in_conductual,

	    output reg [9:0] out_0,
	    output reg [9:0] out_1,
	    output reg [9:0] out_2,
	    output reg [9:0] out_3);
            
always@(posedge clk) begin
           
    if (reset == 1)begin //Si el reset es 1 el flop puede tomar el valor de alguna de las dos entradas
        case(select)  
            2'b00    : out_0 <= in_conductual;       // If sel=0, output can be a  
            2'b01    : out_1 <= in_conductual;       // If sel=1, output is b  
            2'b10    : out_2 <= in_conductual;       // If sel=2, output is c  
            2'b11    : out_3 <= in_conductual;       // If sel=3, output is c  
            default  : out_0 <= in_conductual;       // If sel is something, out is commonly zero  
        endcase  

    end
end
endmodule