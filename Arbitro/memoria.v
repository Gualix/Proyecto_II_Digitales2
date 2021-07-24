

module memoria#(parameter data_width = 10,		// Cantidad de bits de cada bloque
				parameter address_width = 8)	// Cantidad de bloques de mem
				(input [data_width-1:0] FIFO_data_in,
				input clk, reset, 
				input wr_enable, rd_enable,
						//000 -> 1 primer bloque 100 -> 4
				output reg [data_width-1:0] FIFO_data_out);

	// 10 registros de mem con 8 bits
	 reg [data_width-1:0] mem [address_width-1:0];	
	reg  [2:0] wr_ptr, rd_ptr;
	integer i;

	always@(posedge clk) begin
		if (reset) begin
			// Se pone address en cero (el tamaño de la memoria)
			for(i = 0; i<address_width; i=i+1) begin
				mem[i] <= 0;
				wr_ptr<=0;
			end
		end
		else begin
			if (wr_enable) begin
				mem[wr_ptr] <= FIFO_data_in;
				wr_ptr<=wr_ptr+1;
			end
		end
	end

	always@ (posedge clk) begin
		FIFO_data_out = 0;
		if (reset) begin
			FIFO_data_out = 0;
			rd_ptr<=0;
		end
		else if (rd_enable) begin
			FIFO_data_out[data_width-1:0] = mem[rd_ptr];
			rd_ptr<=rd_ptr+1;
		end
	end

endmodule