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

            output reg full_fifo,
            output reg empty_fifo,
            output reg almost_empty_fifo,
            output reg almost_full_fifo,
            output error,
            
            /*output [2:0] wr_ptr, rd_ptr,*/	
            output [data_width-1:0] FIFO_data_out);

            parameter size_fifo = address_width-1; 

    reg [2:0] cnt;
    



memoria mem(.clk(clk), .reset(reset), /*.wr_ptr(wr_ptr),.rd_ptr(rd_ptr),*/ .wrmem_enable(wr_enable)
    ,.rdmem_enable(rd_enable), .memo_data_in(FIFO_data_in),.memo_data_out(FIFO_data_out) );


    always @(posedge clk) begin
        if (reset == 0) begin
            
            if (push) begin
                wr_enable<=1;            
            end
            else if (~push) begin
                wr_enable<=0;
            end

            if (pop  ) begin
                rd_enable<=1;            
            end
            else if (~pop) begin
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
                    if (cnt<=0)begin  
                        cnt <= cnt; 
                    end 
                    else begin
                        cnt <= cnt-1;
                    end
                end
                else begin
                  cnt <= cnt;  
                end
            end  
     


            if (cnt== size_fifo && ~rd_enable) begin
                cnt<= 3'b111;
            end
            
         end
        else begin
            cnt<=0;
        end
    end

  

  always @(posedge clk) begin
     //Llenado del full fifo 
    if (cnt== 3'b111) begin
        
        full_fifo<=1;
    end
    else begin
        full_fifo<=0;
    end 

//Llenado del empty fifo
    if (cnt==0)begin
        empty_fifo<=1;
    end
    else begin
        empty_fifo<=0;
    end
// Llenado del almost_empty
    if (cnt==1)begin
        almost_empty_fifo<=1;
    end
    else begin
        almost_empty_fifo<=0;
    end
//Llenado del almost_full
    if (cnt == size_fifo-1)begin
        almost_full_fifo<=1;
    end
    else begin
        almost_full_fifo<=0;
    end

  end
       
endmodule