module sys_ctrl #(
  parameter IN_WIDTH = 16,
  parameter WIDTH = 8
) (
  input wire CLK_IN,    
  input wire RST_IN,  
  input wire full_flag,
  input wire error,  
  input wire [IN_WIDTH-1:0] Alu_Out,
  input wire Out_Valid,
  input wire [WIDTH-1:0] RX_P_DATA, 
  input wire RX_D_VLD,
  input wire [WIDTH-1:0] RdData,
  input wire RdData_Valid,
  output reg [3:0] ALU_FUN,
  output reg EN,
  output reg Gate_EN,
  output reg [3:0] Address,
  output reg WrEn,
  output reg RdEn,
  output reg [WIDTH-1:0] WrData,
  output reg [WIDTH-1:0] TX_P_DATA,
  output reg TX_D_VLD,
  output reg clk_div_en
);

typedef enum logic [3:0] {
    IDLE                      = 4'b0000,
    REG_FILE_WRITE            = 4'b0001,
    REG_FILE_READ             = 4'b0010,
    REG_FILE_WRITE_WAIT_ADDR  = 4'b0100,
    REG_FILE_WRITE_WAIT_DATA  = 4'b0101,
    REG_FILE_READ_WAIT_ADDR   = 4'b0110,
    ALU_OPER_W_OP             = 4'b0111,
    Write_OP_A                = 4'b1000,
    Write_OP_B                = 4'b1001,
    ALU_FUNC                  = 4'b1010,
    ALU_OPER_W_NOP            = 4'b1011,
    WRITE_LSB                 = 4'b1100,
    WRITE_MSB                 = 4'b1101
} states;

states current_state, next_state;
  reg [3:0] ALU_FUN_comb,Address_comb;
  reg EN_comb,WrEn_comb,RdEn_comb,TX_D_VLD_comb,clk_div_en_comb,Gate_EN_comb;
  reg [WIDTH-1:0] WrData_comb, TX_P_DATA_comb;
  reg is_ALU_operation,is_ALU_operation_seq,done,done_tx,op_A_flag,op_B_flag,op_A_flag_seq,op_B_flag_seq,done_func,done_lsb,done_MSB,done_write_data;
  
                    
// state transition 		
always @(posedge CLK_IN or negedge RST_IN) begin
  if (!RST_IN)
    begin
    current_state <= IDLE;
    ALU_FUN   <= 0;
    EN        <= 0 ;
    Address   <= 0;
    WrEn      <= 0;
    Gate_EN   <=0;
    RdEn      <= 0;
    clk_div_en <=1;
    WrData    <= 0;
    TX_P_DATA <= 0;
    TX_D_VLD  <= 0;
    op_B_flag_seq<=0;
    op_A_flag_seq<=0;
    is_ALU_operation_seq<=0;
  end
  else
    begin
    current_state <= next_state;
    ALU_FUN   <= ALU_FUN_comb;
    EN        <= EN_comb ;
    Address   <= Address_comb;
    WrEn      <= WrEn_comb;
    Gate_EN   <=Gate_EN_comb;
    RdEn      <= RdEn_comb;
    clk_div_en <=1;
    WrData    <= WrData_comb;
    TX_P_DATA <= TX_P_DATA_comb;
    TX_D_VLD  <= TX_D_VLD_comb;
    op_B_flag_seq<=op_B_flag;
    op_A_flag_seq<=op_A_flag;
    is_ALU_operation_seq<=is_ALU_operation;
  end
end
// next state logic
always @(*) begin
next_state=IDLE;
  case (current_state)
    IDLE: begin
        case (RX_P_DATA)
          8'hAA: next_state = REG_FILE_WRITE;
          8'hBB: next_state = REG_FILE_READ;
          8'hCC: next_state = ALU_OPER_W_OP;
          8'hDD: next_state = ALU_OPER_W_NOP;
          default: next_state = IDLE;
        endcase
      end
    //end
    REG_FILE_WRITE:begin
    if (!RX_D_VLD &!error)
        next_state =REG_FILE_WRITE;
      else if(error) 
        next_state = IDLE;
      else
        next_state = REG_FILE_WRITE_WAIT_ADDR;
    end
    REG_FILE_WRITE_WAIT_ADDR: begin
      if (!RX_D_VLD &!error)
        next_state = REG_FILE_WRITE_WAIT_ADDR;
      else if(error) 
        next_state = IDLE;
      else 
        next_state = REG_FILE_WRITE_WAIT_DATA;
    end
    REG_FILE_WRITE_WAIT_DATA: begin
      if (!RX_D_VLD &!error)
        next_state = REG_FILE_WRITE_WAIT_DATA;
        else if(is_ALU_operation & op_A_flag)
           next_state = Write_OP_B;
        else if(is_ALU_operation & op_B_flag)
           next_state =ALU_FUNC ;
         else
        next_state = IDLE;
    end
    REG_FILE_READ: begin
      if (!RX_D_VLD &!error)
        next_state = REG_FILE_READ;
        else if(error) 
        next_state = IDLE;
        else
        next_state = REG_FILE_READ_WAIT_ADDR;
    end
    REG_FILE_READ_WAIT_ADDR: begin
      if (!error &!done_tx)
        next_state = REG_FILE_READ_WAIT_ADDR;
        else if(done &!error) 
        next_state = IDLE;
        else if(error)
        next_state =IDLE;
    end
    ALU_OPER_W_OP: begin
      if(!error & !RX_D_VLD)
      next_state = ALU_OPER_W_OP;
      else if(error)
      next_state = IDLE;
    else
      next_state=Write_OP_A;
    end
    Write_OP_A: begin
      if (!RX_D_VLD &!error)
        next_state = REG_FILE_WRITE_WAIT_DATA;
      else if(error) 
        next_state = IDLE;
      else
        next_state = Write_OP_B;
    end
    Write_OP_B: begin
      if (!RX_D_VLD&!error)
        next_state = REG_FILE_WRITE_WAIT_DATA;
     else if(error) 
        next_state = IDLE;
     else
        next_state = ALU_FUNC;
    end
    ALU_FUNC: begin
        if(error) 
        next_state = IDLE;
      else if(!done_func)
        next_state = ALU_FUNC;
      else 
        next_state =WRITE_LSB ; 
    end
    WRITE_LSB:begin
      if(!error &!done_lsb)
        next_state =WRITE_LSB;
      else if(done &!error)
        next_state =WRITE_MSB;
      else
        next_state = IDLE;
      end
    WRITE_MSB:begin
       if(!error &!done_MSB)
        next_state =WRITE_MSB;
      else if(done &!error)
        next_state = IDLE;
      else
        next_state = IDLE;
      end      
    ALU_OPER_W_NOP: begin
      if(!error & !RX_D_VLD)
      next_state = ALU_OPER_W_NOP;
      else if(error)
      next_state = IDLE;
    else
      next_state=ALU_FUNC;
    end
    default: next_state = IDLE;
  endcase
end
  
  always @(*)
 begin
        ALU_FUN_comb   = ALU_FUN;
        EN_comb        = EN;
        Address_comb   = Address;
        WrEn_comb      = 1'b0;
        RdEn_comb      = 1'b0;
        WrData_comb    =WrData ;
        Gate_EN_comb   =Gate_EN;
        is_ALU_operation=is_ALU_operation_seq;
        done           =0;
        done_tx        =0;
        done_func      =0;
        done_lsb       =0;
        done_MSB       =0;
        TX_P_DATA_comb = TX_P_DATA;
        op_A_flag       =op_A_flag_seq;
        op_B_flag       =op_B_flag_seq;
        TX_D_VLD_comb  = 1'b0;
  case(current_state)
    IDLE:begin
        ALU_FUN_comb   = 4'b0000;
        EN_comb        = 0;
        Gate_EN_comb   =0;
        done_tx=0;
        Address_comb   = 4'b0000;
        WrEn_comb      = 1'b0;
        RdEn_comb      = 1'b0;
        WrData_comb    = 0;
        TX_P_DATA_comb = 0;
        op_B_flag      =0;
        op_A_flag      =0;
        done           =0;
        done_func      =0;
        done_lsb       =0;
        done_MSB       =0;   
        TX_D_VLD_comb  = 1'b0;
        is_ALU_operation=0;
       end
  REG_FILE_WRITE_WAIT_ADDR: begin
    if(!RX_D_VLD)
    Address_comb=RX_P_DATA;
      end
  REG_FILE_WRITE_WAIT_DATA:begin
    WrEn_comb=1;
    if(Address_comb!=0&&Address_comb!=1&&Address_comb!=2&&Address_comb!=3&&!is_ALU_operation &&!RX_D_VLD)
    WrData_comb=RX_P_DATA;
    else if(!RX_D_VLD&is_ALU_operation)
    WrData_comb=RX_P_DATA; 
    //data_succ_written=1; 
     end
  REG_FILE_READ_WAIT_ADDR:begin
    RdEn_comb=1;
    if(!RX_D_VLD)
    Address_comb=RX_P_DATA;
    if(RdData_Valid)
      begin
      TX_P_DATA_comb=RdData;
      if(TX_P_DATA_comb!=0)
      done_tx=1;
    else
     done_tx=0;
      end
      if(!full_flag &done_tx)
       begin
        done=1;
        TX_D_VLD_comb=1;
         end 
      end
  ALU_OPER_W_OP:begin
        is_ALU_operation=1;
      end
    Write_OP_A: begin
       Address_comb=0;
       is_ALU_operation=1;
       op_A_flag=1;
    end
    Write_OP_B: begin
    op_A_flag=0;       
     //Gate_EN_comb=1;
     Address_comb=1;
     is_ALU_operation=1;
     op_B_flag=1;
    end
     WRITE_LSB: begin
       op_B_flag=0;
       is_ALU_operation=1;
      if(Out_Valid &!done_lsb)
        begin
       TX_P_DATA_comb=Alu_Out[7:0];
       done_lsb=1;
        end 
        if(!full_flag &done_lsb)
       begin
        done=1;
        TX_D_VLD_comb=1;
         end 
    end
    WRITE_MSB: begin
      is_ALU_operation=0;
      if(Out_Valid &!done_MSB)
        begin
       TX_P_DATA_comb=Alu_Out[15:8];
       done_MSB=1;
        end 
        if(!full_flag &done_MSB)
       begin
        done=1;
        TX_D_VLD_comb=1; 
         end 
     end
    ALU_FUNC: begin
      ALU_FUN_comb=RX_P_DATA;
      EN_comb=1;
      Gate_EN_comb=1;
      is_ALU_operation=1;
      if(!done_func)
        begin
          ALU_FUN_comb=RX_P_DATA;
          done_func=1;
        end
         
    end
 ALU_OPER_W_NOP:begin
   is_ALU_operation=1;
   Gate_EN_comb=1;
      end
    endcase
  end
                     
  
endmodule




