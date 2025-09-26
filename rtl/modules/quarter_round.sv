module quarter_round #(
    parameter BLOCK_WIDTH = 512,
    parameter WORD_WIDTH  = 32 ,
    parameter WORD_LENGTH = 16 
) (
    input  wire                  clock                     ,       //global clock
    input  wire                  reset_n                   ,       //global reset_n

    input  wire                  key_encryption_valid      ,
    input  wire [WORD_WIDTH-1:0] key_set [WORD_LENGTH-1:0] ,
    
    output wire                  encrypted_key_valid       ,
    output wire [WORD_WIDTH-1:0] key [WORD_LENGTH-1:0] 
);

//-----------------------------------------------------------------------------------------------
//   Internal Signals & FSM Setup                                                                    
//-----------------------------------------------------------------------------------------------

typedef reg [WORD_WIDTH-1:0] typeWordSet [3:0]            ;
typedef reg [WORD_WIDTH-1:0] typeKeySet [WORD_LENGTH-1:0] ;

typeWordSet          qtrRndKey  ;
typeKeySet           keySetTemp ;
reg [WORD_WIDTH-1:0] keySet [WORD_LENGTH-1:0] ;

reg keyEncryptionValid = 0 ; 
reg keyEncryptionTaken = 0 ;
reg keyEncrypting      = 0 ;
reg keyEncryptingDone  = 0 ;

reg encryptedKeyValid  = 0 ;

int iterations     = 20 ;
int iterationCount = iterations ;
int qrtRndCount    = 4  ;
int arrIndex       = 0  ;

int arr1 [8] = '{0,1,2,3,0,1,2,3} ;
int arr2 [8] = '{4,5,6,7,5,6,7,4} ;
int arr3 [8] = '{8,9,10,11,10,11,8,9} ;
int arr4 [8] = '{12,13,14,15,15,12,13,14} ;

int i = 0;

//-----------------------------------------------------------------------------------------------
//   Module Logic                                                                     
//-----------------------------------------------------------------------------------------------

function typeWordSet quarterRound(input typeKeySet keySet, input int i1, input int i2, input int i3, input int i4);
    typeWordSet wordSet ;
    
    keySet[i1] = keySet[i1] + keySet[i2] ; keySet[i4] = keySet[i4] ^ keySet[i1] ; keySet[i4] <<<= 16 ;
    keySet[i3] = keySet[i3] + keySet[i4] ; keySet[i2] = keySet[i2] ^ keySet[i3] ; keySet[i2] <<<= 12 ;
    keySet[i1] = keySet[i1] + keySet[i2] ; keySet[i4] = keySet[i4] ^ keySet[i1] ; keySet[i4] <<<= 8  ;
    keySet[i3] = keySet[i3] + keySet[i4] ; keySet[i2] = keySet[i2] ^ keySet[i3] ; keySet[i2] <<<= 7  ;
    
    wordSet[0] = keySet[i1] ;
    wordSet[1] = keySet[i2] ;
    wordSet[2] = keySet[i3] ; 
    wordSet[3] = keySet[i4] ;
    
    return wordSet ;
endfunction

always_ff @(posedge clock or negedge reset_n) begin
    if (!reset_n) begin
        keyEncryptionValid <= 0 ;
        keyEncryptionTaken <= 0 ;
        keyEncrypting      <= 0 ;
        keyEncryptingDone  <= 0 ;
        encryptedKeyValid  <= 0 ;
        iterationCount     <= 20;
        arrIndex           <= 0 ;
        i  <= 0 ;
    end else begin
        if (key_encryption_valid) begin
            encryptedKeyValid <= 0 ;
            keySet <= key_set ;
            keyEncryptionTaken <= 1 ;
        end else if (keyEncryptionTaken) begin              //main reason to store keys inside keySetTemp
            keyEncryptionTaken <= 0 ;
            keyEncrypting      <= 1 ;
            for ( i=0 ; i < WORD_LENGTH ; i++ ) begin
                keySetTemp[i] <= keySet[i] ;
            end
        end else if (keyEncrypting) begin                   
            for ( i=0 ; i < qrtRndCount ; i++ ) begin
                qtrRndKey <= quarterRound(keySetTemp, arr1[arrIndex], arr2[arrIndex], arr3[arrIndex], arr4[arrIndex]) ;
                keySetTemp[arr1[arrIndex]] <= qtrRndKey[0] ;
                keySetTemp[arr2[arrIndex]] <= qtrRndKey[1] ;
                keySetTemp[arr3[arrIndex]] <= qtrRndKey[2] ;
                keySetTemp[arr4[arrIndex]] <= qtrRndKey[3] ;
                arrIndex <= (arrIndex == 7) ? 0 : arrIndex + 1 ;
            end
            if (iterationCount == 1) begin
                keyEncrypting  <= 00 ;
                iterationCount <= 20 ;
                keyEncryptingDone <= 1 ;
            end
        end else if (keyEncryptingDone) begin
            for ( i=0 ; i < WORD_LENGTH; i++ ) begin
                keySet[i] <= keySetTemp[i] ;
            end
            encryptedKeyValid <= 1 ;
            keyEncryptingDone <= 0 ;
        end
        else encryptedKeyValid <= 0 ;
    end
end

 assign encrypted_key_valid = encryptedKeyValid ;
 assign key = keySet ;

endmodule