/* Este fifo implementa el pop y el push como control de sus entradas y salidas

*/
//`include "memoria.v"

module Fifo #(  parameter data_width = 10,
			    parameter address_width = 8)
            (
            input   clk, reset, 
            output reg wr_enable, rd_enable,
            input   [data_width-1:0] FIFO_data_in,
            input   pop, push,

            output full_fifo ,
            output empty_fifo,
            output almost_full_fifo,
            output almost_empty_fifo,
            output error,
            
            /*output [2:0] wr_ptr, rd_ptr,*/	
            output [data_width-1:0] FIFO_data_out);

            parameter size_fifo = address_width-1; 

    reg [2:0] cnt;
    reg full_fifo,empty_fifo, almost_empty_fifo, almost_full_fifo;


    /*
    assign full_fifo = (cnt == size_fifo);
    assign empty_fifo = (cnt == 0);  
    assign error = (cnt > size_fifo);
    assign almost_empty_fifo = (cnt == 1);
    assign almost_full_fifo = (cnt == size_fifo-1);
    */

memoria mem(.clk(clk), .reset(reset), /*.wr_ptr(wr_ptr),.rd_ptr(rd_ptr),*/ .wrmem_enable(wr_enable)
    ,.rdmem_enable(rd_enable), .memo_data_in(FIFO_data_in),.memo_data_out(FIFO_data_out) );


    always @(posedge clk) begin
        if (reset == 0) begin
            
            if (~full_fifo && push) begin
                wr_enable<=1;            
            end
            else begin
                wr_enable<=0;
            end

            if (pop && !empty_fifo ) begin
                rd_enable<=1;            
            end
            else if (~pop || empty_fifo) begin
                rd_enable<=0;
            end
        end
        else begin
            rd_enable<=0;
            wr_enable<=0;
            full_fifo<=0;
            empty_fifo<=0;
        end
    end



    always @(posedge clk) begin
        if (~reset)begin
            if(wr_enable==1)begin
                if (rd_enable)begin
                    cnt<=cnt;
                end   
                else begin
                    cnt <= cnt+1;
                end

            end 
            else if(wr_enable==0) begin
                if(rd_enable) begin
                 cnt <= cnt-1;
                end
                else begin
                  cnt <= cnt;  
                end
            end  
     

/*        case ({wr_enable, rd_enable})
           2'b00: cnt <= cnt;
           2'b01: cnt <= cnt-1;
           2'b10: cnt <= cnt+1;
           2'b11: cnt <= cnt;
           default: cnt <= cnt;
        endcase*/
            if (cnt== size_fifo && ~rd_enable) begin
                cnt<= 3'b111;
            end
            
         end
        else begin
            cnt<=0;
        end
    end

  always @(*) begin
     //Llenado del full fifo 
    if (cnt== size_fifo) begin
        
        full_fifo=1;
    end
    else begin
        full_fifo=0;
    end 

//Llenado del empty fifo
    if (cnt == 0)begin
        empty_fifo=1;
    end
    else begin
        empty_fifo=0;
    end
// Llenado del almost_empty
    if (cnt == 1)begin
        almost_empty_fifo=1;
    end
    else begin
        almost_empty_fifo=0;
    end
//Llenado del almost_full
    if (cnt == size_fifo-1)begin
        almost_full_fifo = 1;
    end
    else begin
        almost_full_fifo = 0;
    end

  end
       
endmodule