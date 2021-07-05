
module Fifo #(  parameter data_width = 10,
			    parameter address_width = 8)
            (
            input  clk, reset, wr_enable, rd_enable,
            input  [data_width-1:0] data_in,
            output full_fifo,
            output empty_fifo,
            output almost_full_fifo,
            output almost_empty_fifo,
            output error,
            input [2:0] wr_ptr, rd_ptr,	
            output[data_width-1:0] FIFO_data_out);

            parameter size_fifo = address_width; 

    reg [address_width:0] cnt;
    

    assign full_fifo = (cnt == size_fifo);
    assign empty_fifo = (cnt == 0);  
    assign error = (cnt > size_fifo);
    assign almost_empty_fifo = (cnt == 1);
    assign almost_full_fifo = (cnt == size_fifo-1);

memoria mem(.clk(clk), .reset(reset), .wr_ptr(wr_ptr),.rd_ptr(rd_ptr), .wr_enable(wr_enable)
    ,.rd_enable(rd_enable), .FIFO_data_in(data_in),.FIFO_data_out(FIFO_data_out) );

//
    always @(posedge clk) begin
       if (reset == 0) begin
            cnt <= 0;
       end
       else begin
           case ({wr_enable, rd_enable})
               2'b00: cnt <= cnt;
               2'b01: cnt <= cnt-1;
               2'b10: cnt <= cnt+1;
               2'b11: cnt <= cnt;
               default: cnt <= cnt;
           endcase
           end
       end  

  
       
endmodule