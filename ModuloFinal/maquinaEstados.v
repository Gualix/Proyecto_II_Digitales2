module maquinaEstados(

    input clk,
    input reset,
    input init,

    //Umbrales

    input   [2:0]   bajo,                   //umbral bajo
    input   [2:0]   alto,                   //umbral alto

    output reg [3:0]    estado_actual,         //
    output reg [3:0]    sig_estado,

    input [7:0] empty_fifos,

    output reg  active_out,
    output reg  next_active,
    output reg  idle_out,
    output reg  next_idle,

    output reg  [2:0]   bajo_out,                  
    output reg  [2:0]   alto_out,

    output reg  [2:0]   next_bajo,                  
    output reg  [2:0]   next_alto                  
    
);


/************************** ESTADOS ONE HOT ******************************/

    parameter RESET =       4'b0000; //1
    parameter INIT =        4'b0001; //2
    parameter IDLE =        4'b0010; //3
    parameter ACTIVE =      4'b0011; //4

/***********************************************************************/
    reg [7:0] FIFO_empties;

    always @(posedge clk) begin
        if (reset == 1) 
        begin
            
            estado_actual   <= RESET;
            active_out      <= 0;
            idle_out        <= 0;
            bajo_out        <= 0;
            alto_out        <= 0;
            
        end

        else begin
            
            estado_actual = sig_estado;
            
        end
    end


    always @(*) begin
        // Unir errores y empities de FIFOS:
        FIFO_empties[0] = empty_fifos[0]; 
        FIFO_empties[1] = empty_fifos[1]; 
        FIFO_empties[2] = empty_fifos[2]; 
        FIFO_empties[3] = empty_fifos[3]; 
        FIFO_empties[4] = empty_fifos[4]; 
        FIFO_empties[5] = empty_fifos[5]; 
        FIFO_empties[6] = empty_fifos[6]; 
        FIFO_empties[7] = empty_fifos[7];

        case(estado_actual)
            //SEÑAL RESET VIENE DEL PROBADOR
            RESET:begin 

                idle_out = 0;
                    
                if (reset == 0) begin
                    sig_estado = INIT;
                end  
                if (reset == 1) begin    
                    sig_estado = RESET;
                end
                    
            end 
            //SEÑAL INIT VIENE DEL PROBADOR
            INIT: begin 

                idle_out = 0;
                bajo_out = bajo_out;
                alto_out = alto_out;

                //Comento esto para ver si aca se produce el error
                if (!init) begin
                    sig_estado = IDLE;
                end
                if (reset) begin
                    sig_estado = RESET;  
                end
                if (!reset && init)begin
                    next_alto = alto;
                    next_bajo = bajo;
                    sig_estado = INIT; 
                end 

            end 
            //SEÑAL IDLE VIENE DEL PROBADOR
            IDLE: begin

                idle_out = 1;
                alto_out = alto;
                bajo_out = bajo;
                if (reset == 1) begin
                    sig_estado = RESET;
                end
                else if (!reset && init) begin
                    sig_estado = INIT;
                end
                else if (FIFO_empties == 8'b11111111) begin
                    sig_estado = IDLE;
                end                  
                else begin
                    sig_estado = ACTIVE;
                end
            end
            //SEÑAL ACTIVE VIENE DEL PROBADOR
            ACTIVE: begin 

                idle_out = 0;
                bajo_out = bajo_out;
                alto_out = alto_out;

                if (reset == 1) begin
                    sig_estado = RESET;
                end
                else if (!reset && init)begin
                    sig_estado = INIT;
                end

                else if(FIFO_empties==  8'b11111111 )begin   
                    sig_estado = IDLE;
                end
                else begin
                    sig_estado = ACTIVE;
                end
            end
            

            default: 
                begin
                    sig_estado = RESET;
                end 
        
        endcase    
    end
    
endmodule

