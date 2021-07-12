module arbitro(
    // Controles generales del arbitro
            
    input  clk, reset, 

    // Entradas de alimentación de los fifos

    input  almost_full_P0,
    input  almost_full_P1,
    input  almost_full_P2,
    input  almost_full_P3,

    input  empty_P0,
    input  empty_P1,
    input  empty_P2,
    input  empty_P3,
    input  empty_P4,
    input  empty_P5,
    input  empty_P6,
    input  empty_P7,

    // Salidas para el control de los Fifos
            
    output reg pop_F0,
    output reg pop_F1,
    output reg pop_F2,
    output reg pop_F3,

    output reg push_F0,
    output reg push_F1,
    output reg push_F2,
    output reg push_F3);




always @(posedge clk) begin
    if (reset == 0) begin


        // Solamente hace POP si ninguna entrada almost full de esta en 1
        /*if (almost_full_P0 != 1 && almost_full_P1 != 1
            && almost_full_P2 != 1 && almost_full_P3 != 1)*/
            if(~almost_full_P0 | ~almost_full_P1 | ~almost_full_P2 | ~almost_full_P3) begin
            //Revisa las entradas para vaciarlos
            if (empty_P0 == 0) begin
                pop_F0 <= 1;
                pop_F1 <= 0;
                pop_F2 <= 0;
                pop_F3 <= 0;
             
            end 
            else if (empty_P1 == 0) begin
                pop_F0 <= 0;
                pop_F1 <= 1;
                pop_F2 <= 0;
                pop_F3 <= 0;
            end
            else if (empty_P2 == 0) begin
                pop_F0 <= 0;
                pop_F1 <= 0;
                pop_F2 <= 1;
                pop_F3 <= 0;
                

            end
            else if (empty_P3 == 0) begin
                pop_F0 <= 0;
                pop_F1 <= 0;
                pop_F2 <= 0;
                pop_F3 <= 1;
                
            end
 

        end



        if (~almost_full_P0 && ~almost_full_P1 && ~almost_full_P2 && ~almost_full_P3)begin
            push_F0 <= 1;
            push_F1 <= 1;
            push_F2 <= 1;
            push_F3 <= 1;
        end
        else begin
            push_F0 <= 0;
            push_F1 <= 0;
            push_F2 <= 0;
            push_F3 <= 0;
        end

        //Cuando recibe datos en los FIFOs de la salida, los saca
        /*if (almost_full_P0 == 1) begin
            push_F0 <= 0;
        end
        if (almost_full_P1 == 0) begin
            push_F1 <= 0;
        end
        if (almost_full_P2 == 0) begin
            push_F2 <= 0;
        end
        if (almost_full_P3 == 0) begin
            push_F3 <= 0;
        end*/

    end
    else if(reset == 1)begin
         push_F0 <= 0;
         push_F1 <= 0;
         push_F2 <= 0;
         push_F3 <= 0;

         pop_F0 <= 0;
         pop_F1 <= 0;
         pop_F2 <= 0;
         pop_F3 <= 0;
    end
end

endmodule