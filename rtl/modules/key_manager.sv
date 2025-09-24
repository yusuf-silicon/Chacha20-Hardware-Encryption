module key_manager #(
    parameter BLOCK_WIDTH = 512,
    parameter WORD_WIDTH  = 32 ,
    parameter WORD_LENGTH = 16 ,
    parameter CONST_COUNT = 4 ,
    parameter KEYS_COUNT  = 8000 
) (
    input  wire                   clock         ,       //global clock
    input  wire                   reset_n       ,       //global reset_n

    output wire                   key_set_valid ,       // tells ready to send next input
    output wire [BLOCK_WIDTH-1:0] key_set       ,       // input - keySet (512 bits)
    input  wire                   key_set_ready ,       // tells ready to receive next input

    input  wire                   nonce_valid   ,
    input  wire [WORD_WIDTH-1:0]  nonce [2:0]   ,
    output wire                   nonce_ready   
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
reg keySetReady    = 0 ;

integer count      = 0 ;
integer indexKey   = 0 ;

integer i ;

//-----------------------------------------------------------------------------------------------
//   Module Logic                                                                     
//-----------------------------------------------------------------------------------------------

initial begin
    $readmemh("../data/constants.txt",keySetReg) ;
    $readmemh("../data/keys.txt",keys)           ;
end

always_ff @(posedge clock or negedge reset_n) begin
    if (!reset_n) begin
        keyReady    <= 0 ;
        keySetReady <= 0 ;
        nonceReady  <= 1 ;
        count       <= 0 ;
        indexKey    <= 0 ;
    end else begin
        if (!keyReady && nonce_valid) begin
            keySetReady <= 0 ;
            for ( i=4 ; i < 12 ; i++ ) begin
                keySetReady[i] <= keys[$urandom % KEYS_COUNT] 
            end
            if (count == 32'hffffffff) begin
                keySetReady[12] <= count ;
                count <= 0               ;
            end else begin
                keySetReady[12] <= count ; 
                count++                  ;
            end
            for ( i=13 ; i <= 15 ; i++ ) begin
                keySetReg[i] <= nonce[i-13];
            end
            nonceReady <= 0   ;
            keyReady <= 1     ;
        end
        if (keyReady) begin
            keySetReady <= 1 ;
            if (key_set_valid) begin
                keyReady <= 0;
                nonceReady <= 1;
            end
        end
    end
end

assign key_set_ready = keySetReady ;
assign key_set = keySetReg         ;
assign nonce_ready = nonceReady    ;

endmodule
