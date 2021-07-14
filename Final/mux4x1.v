
/* ------------------------------------------  
Multiplexor que recibe 4 entradas y tiene salida de 10 bits, 
para ser utilizados en el roundRobin del proyecto 2
------------------------------------------ */

module mux4x1 (
        input clk,
        input reset,
        input [1:0] select,

	    input [9:0] in_0,
	    input [9:0] in_1,
	    input [9:0] in_2,
	    input [9:0] in_3,

        output reg [9:0] out_mux);
            
always@(*) begin
           
    if (reset == 0)begin //Si el reset es 1 el flop puede tomar el valor de alguna de las dos entradas
        case(select)  
            2'b00    : out_mux = in_0;       // If sel=0, output can be a  
            2'b01    : out_mux = in_1;       // If sel=1, output is b  
            2'b10    : out_mux = in_2;       // If sel=2, output is c  
            2'b11    : out_mux = in_3;       // If sel=3, output is c  
            default  : out_mux = in_0;       // If sel is something, out is commonly zero  
        endcase  
    end
    else if (reset==1) begin
        out_mux<=0;
    end

    
end
endmodule