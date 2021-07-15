
/* ------------------------------------------  
Demultiplexor que genera 4 salidas y tiene una entrada en 10 bits, 
para ser utilizados en el roundRobin del proyecto 2
------------------------------------------ */

module demux4x1 (
        input clk,
        input reset,
        input [1:0] select,
        input [9:0] in_demux,

	    output reg [9:0] out_0,
	    output reg [9:0] out_1,
	    output reg [9:0] out_2,
	    output reg [9:0] out_3);
            
always@(*) begin
           
    if (reset == 0)begin //Si el reset es 1 el flop puede tomar el valor de alguna de las dos entradas
        case(select)  
            2'b00:  begin 
                        out_0 <= in_demux;       // If sel=0, output can be a  
                        out_1<=0;
                        out_2<=0;
                        out_3<=0;
            end
            
            2'b01    : begin
                        out_1 <= in_demux;       // If sel=1, output is b 
                        out_0<=0;
                        out_2<=0;
                        out_3<=0; 
            end
            2'b10    : begin
                        out_2 <= in_demux;       // If sel=2, output is c  
                        out_0<=0;
                        out_1<=0;
                        out_3<=0;
            end
            2'b11    : begin
            
                        out_3 <= in_demux;       // If sel=3, output is c  
                        out_0<=0;
                        out_1<=0;
                        out_2<=0;
            end
            default  : out_0 <= in_demux;       // If sel is something, out is commonly zero  
        endcase  

    end
     else if (reset==1) begin
        out_0<=0;
        out_1<=0;
        out_2<=0;
        out_3<=0;
    end
end
endmodule