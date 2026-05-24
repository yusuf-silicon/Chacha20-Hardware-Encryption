`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2025 15:12:42
// Design Name: 
// Module Name: mainTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mainTB();

parameter BLOCK_WIDTH  = 512  ;
parameter WORD_WIDTH   = 32   ;
parameter WORD_LENGTH  = 16   ;
parameter CLOCK_PERIOD = 10   ;
parameter RESET_CYCLES = 5    ;

parameter VALUE_COUNT  = 1600 ;
parameter NONCE_COUNT  = 3000 ;

// MAIN SIGNALS
reg                   clock                        ; 
reg                   reset_n                      ; 

reg                   valueValid                   ; 
reg  [WORD_WIDTH-1:0] value      [WORD_LENGTH-1:0] ; 
wire                  valueReady                   ; 

reg                   nonceValid                   ; 
reg  [WORD_WIDTH-1:0] nonce      [2:0]             ; 
wire                  nonceReady                   ; 

wire                  codeValid                    ; 
wire [WORD_WIDTH-1:0] code       [WORD_LENGTH-1:0] ; 
reg                   codeReady                    ; 

//MEMORY - BRAM
reg  [WORD_WIDTH-1:0] valueMem [VALUE_COUNT-1:0] ; 
reg  [WORD_WIDTH-1:0] nonceMem [NONCE_COUNT-1:0] ; 

//INTERNAL SIGNALS
reg  [WORD_WIDTH-1:0] nonceOut [2:0]             ;  // fetchinput task
reg  [WORD_WIDTH-1:0] valueOut [WORD_LENGTH-1:0] ; 

reg [WORD_WIDTH-1:0] codeRead [WORD_LENGTH-1:0];                      // encryption task
reg value_done   = 0 ;
reg nonce_done   = 0 ;
reg codeout_done = 0 ;

integer i = 0 ;
integer j = 0 ;
integer k = 0 ;

top top_entity(
    .clock       (clock      ) ,
    .reset_n     (reset_n    ) ,

    .value_valid (valueValid ) ,
    .value       (value      ) ,
    .value_ready (valueReady ) ,

    .nonce_valid (nonceValid ) ,
    .nonce       (nonce      ) ,
    .nonce_ready (nonceReady ) ,

    .code_valid  (codeValid  ) ,
    .code        (code       ) ,
    .code_ready  (codeReady  ) 
);

initial clock = 0 ;
always #(CLOCK_PERIOD/2) clock = ~clock ;

initial begin
    reset_n = 0 ;
    repeat (RESET_CYCLES) @(posedge clock) ;
    reset_n = 1 ;
    $display("[%0t] reset_n deasserted", $time);
end

//store values into BRAM
initial begin
    $readmemh("../../../../../../data/value.txt" , valueMem) ;
    $readmemh("../../../../../../data/nonce.txt" , nonceMem) ;
//    for ( i=0 ; i < 5 ; i++ ) begin
//        $display("The value of valueMem at [ %d ] is: %h",i*100,valueMem[i*100]) ; 
//    end 
//    for ( i=0 ; i < 5 ; i++ ) begin
//        $display("The value of nonceMem at [ %d ] is: %h",i*100,nonceMem[i*100]) ; 
//    end
end

task encryption(input [WORD_WIDTH-1:0] valuein [WORD_LENGTH-1:0], input [WORD_WIDTH-1:0] noncein [2:0], output [WORD_WIDTH-1:0] codeout [WORD_LENGTH-1:0]);
begin
    fork
        begin //value
            @(posedge clock) ;
            valueValid = 1   ;
            value = valuein  ;
            while (!valueReady) @(posedge clock)
            valueValid = 0   ;
            value_done = 1   ;
        end
        begin //nonce
            @(posedge clock) ;
            nonceValid = 1   ;
            nonce = noncein  ;
            while (!nonceReady) @(posedge clock)
            nonceValid = 0   ;
            nonce_done = 1   ;
        end
        begin //codeout
            @(posedge clock) ;
            while (!(nonce_done && value_done)) @(posedge clock) ;
            nonce_done   = 0 ;
            value_done   = 0 ;
            codeReady    = 1 ;
            while (!codeValid) @(posedge clock) ;
            codeout = code   ;
            codeout_done = 1 ;
            repeat (2) @(posedge clock) ;
            codeout_done = 0 ;
            codeReady    = 0 ;

        end
    join
    $display("( %0d )",k) ;
    $display("Value :") ;
    k++ ;
    for ( i=0 ; i < 3 ; i++ ) begin
        $display("[ %h %h %h %h ]",valuein[4*i], valuein[(4*i)+1], valuein[(4*i)+2], valuein[(4*i)+3]);
    end 
    $display("Code :") ;
    for ( i=0 ; i < 3 ; i++ ) begin
        $display("[ %h %h %h %h ]",codeout[4*i], codeout[(4*i)+1], codeout[(4*i)+2], codeout[(4*i)+3]);
    end 
    $display(" ") ;
end    
endtask

task fetchinput(output [WORD_WIDTH-1:0] valueOut [WORD_LENGTH-1:0], output [WORD_WIDTH-1:0] nonceOut [2:0]);
    for ( i=0 ; i < WORD_LENGTH ; i++ ) begin
        valueOut[i] = valueMem[j];
        j = (j == 1599) ? 0 : j + 1 ;
    end 
    for ( i=0 ; i < 3 ; i++ ) begin
        nonceOut[i] = nonceMem[$urandom_range(NONCE_COUNT-1)];
    end
endtask 

initial begin
    valueValid = 0 ; 
    nonceValid = 0 ;
    codeReady  = 0 ;

@(posedge clock)   ;
@(posedge reset_n) ;

fetchinput(valueOut,nonceOut) ;
encryption(valueOut, nonceOut, codeRead) ;
fetchinput(valueOut,nonceOut) ;
encryption(valueOut, nonceOut, codeRead) ;
fetchinput(valueOut,nonceOut) ;
encryption(valueOut, nonceOut, codeRead) ;

end

endmodule