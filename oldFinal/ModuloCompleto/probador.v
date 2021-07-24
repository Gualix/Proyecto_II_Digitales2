module probador #(
    
    output reg clk,
    output reg reset,
    output regs,
    //Para la maquina de estados
    output reg init,
    output reg [2:0] alto,bajo,
    //Para el probador de abajo
    output reg [9:0] FIFO_data_in0,
    output reg [9:0] FIFO_data_in1,
    output reg [9:0] FIFO_data_in2,
    output reg [9:0] FIFO_data_in3,
    output reg push0,
    output reg push1,
    output reg push2,
    output reg push3, 


    //Para el probador de arriba
    output reg pop4,
    output reg pop5,
    output reg pop6,
    output reg pop7,

    //Para el contador
    output reg [1:0] idx,                        //index
    output reg req,                        //request
    output reg IDLE,




    //Outputs de los fifos
    input  [9:0] FIFO_data_out4,
    input  [9:0] FIFO_data_out5,
    input  [9:0] FIFO_data_out6,
    input  [9:0] FIFO_data_out7


    //input del contador 
    input    valid_contador, //salida  valid_contador contador
    input  [4:0] contador_out, //contador salida del index de interes
                
               
);

    initial begin
        $dumpfile("completo.vcd");
        $dumpvars;

        /*Saque el bloque de RESET, manteniendo el estado de INIT (señal init)*/

        bajo =  3'b000;
        alto =  3'b100;

        FIFO_data_in0 = 0;
        FIFO_data_in1 = 0;
        FIFO_data_in2 = 0;
        FIFO_data_in3 = 0;

        reset = 0;
        init = 0;

        @(posedge clk)
        reset <= 0;

        @(posedge clk)
        init <= 1;
        /*Modifique 2 veces los umbrales altos y bajos de los FIFOs*/

        @(posedge clk)
        bajo =  3'b001;
        alto =  3'b010;

        @(posedge clk)
        bajo =  3'b011;         //3
        alto =  3'b101;         //5

        @(posedge clk)
        init <= 0;
        /*Provoque un Almost Full en todos los FIFOs de salida, el árbitro 
        no le permitirá hacerlo de forma simultánea. Desde el probador, 
        haga la menor cantidad de POPs. Verifique que las palabras que 
        salieron son las mismas que entraron y que salieron por la salida 
        correcta en la prioridad correcta.*/

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;


        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;
        
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        @(posedge clk)
        pop4 <= 1;
        @(posedge clk)
        pop4 <= 0;

        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        @(posedge clk)
        pop5 <= 1;
        @(posedge clk)
        pop5 <= 0;

        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        /*Provoque un Almost Full en todos los FIFOs de entrada. 
        Luego usando POPs del probador deje todos los FIFOs vacíos. 
        Verifique que las palabras que salieron son las mismas que
        entraron y que salieron por la salida correcta en la prioridad 
        correcta.*/

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop4 <= 1;
        pop5 <= 1;
        pop6 <= 1;
        pop7 <= 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop4 <= 1;
        pop5 <= 1;
        pop6 <= 1;
        pop7 <= 1;

         @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop4 <= 1;
        pop5 <= 1;
        pop6 <= 1;
        pop7 <= 1;

         @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop4 <= 1;
        pop5 <= 1;
        pop6 <= 1;
        pop7 <= 1;

        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop4 <= 1;
        pop5 <= 1;
        pop6 <= 1;
        pop7 <= 1;

        /*Lea los contadores de palabras.*/

         @(posedge clk)
         IDLE <= 1;   
         req <= 1;
         idx <= 0;

         @(posedge clk)
         idx <= 1;

        @(posedge clk)
         idx <= 2;

        @(posedge clk)
         idx <= 3;

        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        /*Envíe 16 palabras, 4 a cada FIFO de entrada, y cada set de 
        4 palabras por FIFO de entrada estén con destino a cada FIFO 
        de salida (las 4x4=16 combinaciones posibles). Deje todos los
        FIFOs vacíos. Verifique que las palabras que salieron son las 
        mismas que entraron y que salieron por la salida correcta en 
        la prioridad correcta.*/

        /*Lea los contadores de palabras y valide un aumento de 
        4 palabras por contador*/
        
        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

        @(posedge clk)
        FIFO_data_in0 <= 'hFF;
        FIFO_data_in1 <= 'hF0;
        FIFO_data_in2 <= 'hF0;
        FIFO_data_in3 <= 'hFF;

      
      $finish;    
    end
initial clk <= 1;
    always #1 clk <= ~clk; 
endmodule