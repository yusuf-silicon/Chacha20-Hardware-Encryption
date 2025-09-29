`timescale 1ns / 1ps

module key_manager #(
    parameter BLOCK_WIDTH = 512,
    parameter WORD_WIDTH  = 32 ,
    parameter WORD_LENGTH = 16 ,
    parameter CONST_COUNT = 4 ,
    parameter KEYS_COUNT  = 8000 
) (
    input  wire                  clock                     ,       //global clock
    input  wire                  reset_n                   ,       //global reset_n
            
    output wire                  key_set_valid             ,       // tells ready to send next input
    output wire [WORD_WIDTH-1:0] key_set [WORD_LENGTH-1:0] ,       // input - keySet (512 bits)
    input  wire                  key_set_ready             ,       // tells ready to receive next input

    input  wire                  nonce_valid               ,
    input  wire [WORD_WIDTH-1:0] nonce [2:0]               ,
    output wire                  nonce_ready   
) ;

//-----------------------------------------------------------------------------------------------
//   Block RAM
//-----------------------------------------------------------------------------------------------

reg [WORD_WIDTH-1:0] constants [CONST_COUNT-1:0] ;      // Stores Constants
reg [WORD_WIDTH-1:0] keys      [KEYS_COUNT-1:0]  ;      // Stores Keys

//-----------------------------------------------------------------------------------------------
//   Internal Signals & Values
//-----------------------------------------------------------------------------------------------

reg [WORD_WIDTH-1:0] keySetReg [WORD_LENGTH-1:0] ;

reg nonceReady     = 0 ;

reg keyReady       = 0 ;
reg keySetValid    = 0 ;

integer count      = 0 ;
integer indexKey   = 0 ;

integer i = 0;
integer j = 0;

//-----------------------------------------------------------------------------------------------
//   Module Logic                                                                     
//-----------------------------------------------------------------------------------------------

initial begin
    $readmemh("../../../../../data/constants.txt",constants) ;
    $readmemh("../../../../../data/keys.txt",keys)           ;
    for ( j=0 ; j <= 3 ; j++) begin
        keySetReg[15-j] = constants[j] ;
    end
//    for ( i=0 ; i < 4 ; i++ ) begin
//        $display("The value of constants at [ %d ] is: %h",i, constants[i]) ; 
//        $display("The value of constants inside keySetReg is at [ %d ] is: %h",(15-i), keySetReg[15-i]) ; 
//    end
//    for ( i=0 ; i < 5 ; i++ ) begin
//        $display("The value of keys at [ %d ] is: %h",i*100, keys[i*100]) ; 
//    end
end

always_ff @(posedge clock or negedge reset_n) begin
    if (!reset_n) begin
        keyReady    <= 0 ;
        keySetValid <= 0 ;
        nonceReady  <= 1 ;
        count       <= 0 ;
        indexKey    <= 0 ;
        i <= 0 ;

    end else begin
        if (!keyReady && nonce_valid) begin
            keySetValid <= 0 ;
            for ( i=0 ; i < 8 ; i++ ) begin
                keySetReg[11-i] <= keys[$urandom % KEYS_COUNT] ;
            end
            if (count == 32'hffffffff) begin
                keySetReg[3] <= count ;
                count <= 0               ;
            end else begin
                keySetReg[3] <= count ; 
                count++                  ;
            end
            for ( i=0 ; i < 3 ; i++ ) begin
                keySetReg[2-i] <= nonce[2-i];
            end
            nonceReady <= 0   ;
            keyReady <= 1     ;
        end
        if (keyReady) begin
            keySetValid <= 1 ;
            if (key_set_ready) begin
                keyReady <= 0;
                nonceReady <= 1;
            end
        end
    end
end

assign key_set_valid = keySetValid ;
assign key_set = keySetReg         ;
assign nonce_ready = nonceReady    ;

endmodule
