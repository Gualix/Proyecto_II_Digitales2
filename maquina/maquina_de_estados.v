module maquina_de_estados(
    input clk,
    input reset,
    input init,

    //umbrales

    input   [7:0]           bajo,                   //umbral bajo
    input   [7:0]           alto,                   //umbral alto

    output reg [3:0]        estado_actual,         //
    output reg [3:0]        sig_estado,

    input [7:0]             empty_fifos,

    output reg              active_out,
    output reg              next_active,
    output reg              idle_out,
    output reg              next_idle,

    output reg   [7:0]           bajo_out,                  
    output reg   [7:0]           alto_out,

    output reg   [7:0]           next_bajo,                  
    output reg   [7:0]           next_alto                  


      
);


/************************** ESTADOS ONE HOT ******************************/

    parameter RESET =       4'b0000; //1
    parameter INIT =        4'b0001; //2
    parameter IDLE =        4'b0010; //3
    parameter ACTIVE =      4'b0100; //4

/***********************************************************************/

   

/***********************************************************************/
    reg [7:0] FIFO_empties;


    always @(posedge clk) begin
        if (reset == 1) 
        begin
            
            estado_actual   <= RESET;
            active_out      <= 0;
            idle_out        <= 0;
            bajo_out        <=0;
            alto_out        <=0;
            
        end

        else begin
            
            estado_actual <= sig_estado;
            active_out <= next_active;
            idle_out <= next_idle;
            bajo_out <= next_bajo;
            alto_out <= next_alto;
            
            
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

        sig_estado = estado_actual;
        
        next_active = active_out;
        next_idle = idle_out;
        next_alto = alto_out;
        next_bajo = bajo_out;
       
       case(estado_actual)

            RESET:begin

                    if (reset == 0) sig_estado = INIT;  
                     
                    else sig_estado = RESET;
                    
                end 

            INIT: begin

                    if (init) begin
                        sig_estado = IDLE;
                        
                    end
                    else if (!reset) sig_estado = RESET;  
                    else if (reset && !init)begin
                        next_alto = alto;
                        next_bajo = bajo;
                        sig_estado = INIT; 
                    end 

                end 
            
            IDLE: begin
                    next_idle = 1;

                    if (FIFO_empties[0]==0 && FIFO_empties[1]==0 && FIFO_empties[2]==0 && FIFO_empties[3]==0 && FIFO_empties[4]==0 && FIFO_empties[5]==0 && FIFO_empties[6]==0 && FIFO_empties[7]==0)
                    begin
                        sig_estado = IDLE;
                    end

                    else begin
                        sig_estado = ACTIVE;
                    end

                    if (reset == 1) sig_estado = RESET;
                    
                    end

            ACTIVE: begin
                    if (!FIFO_empties) 
                    begin
                        sig_estado = ACTIVE;
                        next_active = 1;
                        next_idle = 0;
                    end
                    else if (reset==1) sig_estado = RESET;
                    
                end
            

            default: 
            
            begin
                sig_estado = RESET;
            end 
        
        endcase    
    end
    
endmodule

