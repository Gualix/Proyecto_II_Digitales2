//4 contadores cada uno pegado a cada una de las palabras

//miden la cantidad de palabras que salen del FIFO
//contadores que cuenta 0123 y se resetean en reset

//5 bits cuenta hasta 32 palabras data[5:0]

//se pueden leer en estado de IDLE
//el probador da un req y un idx req 1 es leer y el index es para ver cual contador leer

//devuelve el dato y un valid_contador el contador

module contador#(
                    parameter data_width = 10, 
                    parameter address_width = 3,
                    parameter tam = 5

)(
    
    //*********************** ENTRADAS ******************************//

    input       clk,                        //reloj
    input       reset,                      //reset
    input       [1:0] idx,                  //index
    input       req,                        //request
    input       pop_F0,  
    input       pop_F1,  
    input       pop_F2,  
    input       pop_F3,      
    //entrada datos del fifo
    input       IDLE,                      //activado para leer
    input       empty_P4,
    input       empty_P5,
    input       empty_P6,
    input       empty_P7,

//*********************** SALIDAS ******************************//
    output reg                          valid_contador, //salida  valid_contador contador
    output reg  [4:0]                   contador_out
    
    
    );  //contador salida del index de interes



//******************** REGISTROS **********************************//



    
    //reg     [tam-1:0]         contador_fifo1;        //contador de salida

    reg     [ 9: 0]      contador_fifo0;                 //
    reg     [ 9: 0]      contador_fifo1;
    reg     [ 9: 0]      contador_fifo2;
    reg     [ 9: 0]      contador_fifo3;



//********************* LOGICA ******************************//


always @(posedge clk) 
begin

    if (reset==1) 
        begin
            
             contador_out   <=  0;          //salida data
             valid_contador <=  0;          // valid_contador
            
            /* Fifo 0 */
                                                //reg anterior en 0
            contador_fifo0 <= 0;                //contador fifo 1 en 0
            
            /* Fifo 1 */            
            
            contador_fifo1 <= 0;

            /* Fifo 2 */
            
            contador_fifo2 <= 0;

            /* Fifo 3 */
            
            contador_fifo3 <= 0;



        end

    else if (reset == 0)
        begin
                    
                
                    //*********DATO0***************//
                    
                    
                    if(pop_F0!=0 && empty_P4 == 0)
                    begin
                        
                       //el dato anterior ahora es el dato entrante
                        contador_fifo0  <= contador_fifo0 + 1;  
                        valid_contador  <= 1;
                        

                    end
                    
                    if(pop_F1!=0 && empty_P5 ==0 )

                    begin
                        
                         //el dato anterior ahora es el dato entrante
                        contador_fifo1  <= contador_fifo1 + 1;    
                        valid_contador  <= 1;
                        
                    end

                    if(pop_F2!=0 && empty_P6 ==0 )

                    begin
                        
                        //el dato anterior ahora es el dato entrante
                        contador_fifo2  <= contador_fifo2 + 1;    
                        valid_contador  <= 1;
                        
                    end

                    if(pop_F3!=0 && empty_P7 ==0 )
                    begin
                        
                        //el dato anterior ahora es el dato entrante
                        contador_fifo3  <= contador_fifo3 + 1;
                        valid_contador  <= 1;
                        
                    end

                    //************LECTURA*******************//
                    if(req == 1 && IDLE == 1)
                    begin
                        if(idx == 0)
                        begin
                                contador_out             <= contador_fifo0;
                                valid_contador           <= 1;
                        end
                    
                    
                    else if(idx == 1)
                        begin
                                 contador_out             <= contador_fifo1;
                                 valid_contador           <= 1;
                        end
                     
                    else if(idx == 2)
                        begin
                                contador_out              <= contador_fifo2;
                                 valid_contador           <= 1;
                        end                        
                     else if(idx == 3)
                        begin
                                contador_out  <= contador_fifo3;
                                 valid_contador           <= 1;
                        end

                    end
        end
end

endmodule  

