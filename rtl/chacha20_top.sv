`timescale 1ns / 1ps

module top #(
    parameter BLOCK_WIDTH = 512,
    parameter WORD_WIDTH  = 32 ,
    parameter WORD_LENGTH = 16 
) (
    input  wire                  clock                         , // global clock
    input  wire                  reset_n                       , // global reset_n

    input  wire                  value_valid                   , // handshake valid received
    input  wire [WORD_WIDTH-1:0] value       [WORD_LENGTH-1:0] , // input - value (512 bits)
    output wire                  value_ready                   , // handshake ready sent

    input  wire                  nonce_valid                   , // handshake valid received             
    input  wire [WORD_WIDTH-1:0] nonce       [2:0]             , // input - nonce (96 bits)       
    output wire                  nonce_ready                   , // handshake ready sent

    output wire                  code_valid                    , // handshake valid received
    output wire [WORD_WIDTH-1:0] code        [WORD_LENGTH-1:0] , // output - value (512 bits)
    input  wire                  code_ready                      // handshake ready sent
) ;

//-----------------------------------------------------------------------------------------------
//   Sub Module Initialisation                                                                     
//-----------------------------------------------------------------------------------------------

core core_entity (
    .clock       (clock      ) ,                    
    .reset_n     (reset_n    ) ,                          
    .value_valid (value_valid) ,                                  
    .value       (value      ) ,                    
    .value_ready (value_ready) ,                                  
    .nonce_valid (nonce_valid) ,                                  
    .nonce       (nonce      ) ,                    
    .nonce_ready (nonce_ready) ,                                  
    .code_valid  (code_valid ) ,                             
    .code        (code       ) ,                   
    .code_ready  (code_ready )                              
);

endmodule