`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2025 15:13:12
// Design Name: 
// Module Name: main
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


module core #(
    parameter BLOCK_WIDTH = 512,
    parameter WORD_WIDTH  = 32 ,
    parameter WORD_LENGTH = 16 
) (
    input  wire                  clock       ,       //global clock
    input  wire                  reset_n     ,       //global reset_n

    input  wire                  value_valid ,       // tells ready to send next input
    input  wire[BLOCK_WIDTH-1:0] value       ,       // input - value (512 bits)
    output wire                  value_ready ,       // tells ready to receive next input

    input  wire                  nonce_valid ,
    input  wire [WORD_WIDTH-1:0] nonce [2:0] ,
    output wire                  nonce_ready   
) ;

//-----------------------------------------------------------------------------------------------
//   Sub Module Initialisation                                                                     
//-----------------------------------------------------------------------------------------------

key_manager key_manager_entity#()(
    .clock         (clock  )       ,       
    .reset_n       (reset_n)       ,       

    .key_set_valid (key_set_valid) ,       
    .key_set       (keySetReg    ) ,       
    .key_set_ready (keySetReady  ) ,        

    .nonce_valid   (nonce_valid  ) ,
    .nonce         (nonce        ) ,
    .nonce_ready   (nonce_ready  ) 
);

quarter_round quarter_round_entity#()(
    .clock                (clock             ) , 
    .reset_n              (reset_n           ) ,     

    .key_encryption_valid (keyEncryptionValid) ,                            
    .key_set              (keySetReg         ) ,     
    
    .encrypted_key_valid  (encryptedKeyValid ) ,                               
    .key                  (encryptedKeySet   )
);

//-----------------------------------------------------------------------------------------------
//   Internal Signals & FSM Setup                                                                    
//-----------------------------------------------------------------------------------------------

reg [WORD_WIDTH-1:0]  keySetReg [WORD_LENGTH-1:0] = 0 ;
reg [WORD_WIDTH-1:0]  encryptedKeySet [WORD_LENGTH-1:0] = 0 ;
reg                   keySetReady = 0 ;

reg                   valueReady  = 0 ;
reg [BLOCK_WIDTH-1:0] valueReg    = 0 ;

reg                   keyTaken    = 0 ;
reg                   valueTaken  = 0 ;

//signals and flags for fsm state KEY_OPR
reg  keyEncryptionValid = 0 ;
reg  keyEncryptionSent  = 0 ;
reg  encryptedKeyReady  = 0 ;
reg  keyEncrypted       = 0 ;
wire encryptedKeyValid      ;

//fsm states
typedef enum logic [1:0] {
    IDLE    ,
    KEY_OPR ,
    VAL_OPR ,
    SEND    
} state ;

state current_state, next_state ;

//-----------------------------------------------------------------------------------------------
//   Module Logic                                                                     
//-----------------------------------------------------------------------------------------------

always_ff @( posedge clock or negedge reset_n ) begin : Current_State_Register
    if (!reset_n) begin
        current_state <= IDLE ;
    end else begin
        current_state <= next_state ;
    end 
end

always_comb begin : Next_State_Logic
    next_state = current_state ;
    case (state)
        IDLE : begin
            if (valueTaken && keyTaken) begin
                next_state = KEY_OPR ;
            end
        end
        KEY_OPR : begin
            if (keyEncrypted) begin
                next_state = VAL_OPR ;
            end
        end 
        VAL_OPR : begin
            
        end 
        SEND : begin
            
        end 
        default: next_state = IDLE ; 
    endcase
end

always_ff @(posedge clock or negedge reset_n ) begin : Output_Logic
    if (!reset_n) begin
        valueTaken         <= 0 ;
        valueReady         <= 0 ;
        valueReg           <= 0 ;
        keySetReady        <= 0 ;
        keyTaken           <= 0 ;
        
        keyEncryptionValid <= 0 ;
        encryptedKeyReady  <= 0 ;
        keyEncryptionSent  <= 0 ;
        keyEncrypted       <= 0 ;
    end else begin
        case (state)
            IDLE : begin
                valueReady <= valueTaken ? 0 : 1 ;
                keySetReady  <= keyTaken ? 0 : 1 ;
                if (!valueTaken && value_valid) begin
                    valueTaken <= 1 ;
                    valueReg <= value ;
                end
                if (!keyTaken && keySetValid)   begin
                    keyTaken  <= 1      ;
                    keySetReg <= KeySet ;
                end
            end KEY_OPR : begin
                valueReady   <= 0 ;     //  
                keySetReady  <= 0 ;     //  reset previous state values
                valueTaken   <= 0 ;     //  
                keyTaken     <= 0 ;     //  
                keyEncryptionValid <= keyEncryptionSent ? 0 : 1 ;
                keyEncryptionSent <= 1 ;
                encryptedKeyReady <= keyEncryptionSent ? 1 : 0; 
                if (encryptedKeyReady && encryptedKeyValid) begin 
                    keySetReg <= keySetReg + encryptedKeySet ;
                    keyEncrypted <= 1 ; 
                end
            end VAL_OPR : begin
                keyEncryptionSent  <= 0 ;
                keyEncryptionValid <= 0 ;
                encryptedKeyReady  <= 0 ;
                keyEncrypted       <= 0 ;
                
            end SEND    : begin
                
            end
        endcase
    end
end

assign value_ready = valueReady ;

endmodule