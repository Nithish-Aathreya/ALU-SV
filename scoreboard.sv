class scoreboard;
    mailbox mon2scb;
  transaction trans;
  
     function new( mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  logic [15:0]y;
  string p;
  
    parameter add=4'b0000,sub=4'b0001,mul=4'b0010,div=4'b0011,AND=4'b0100,OR=4'b0101,NAND=4'b0110,NOR=4'b0111,XOR=4'b1000,XNOR=4'b1001;
  
  task main();
    repeat(1)
      begin
    mon2scb.get(trans);
   
    
    if(trans.enable==1'b1)
      begin
         case(trans.command)
      add:y=trans.a + trans.b;
        sub:y=trans.a - trans.b;
        mul:y=trans.a*trans.b;
        div:y=trans.a / trans.b;
        AND:y=trans.a & trans.b;
        OR:y=trans.a | trans.b;
      NAND:y= ~(trans.a & trans.b);
      NOR:y= ~(trans.a | trans.b);
        XOR:y= trans.a ^ trans.b;
      XNOR:y=~(trans.a ^ trans.b);
    endcase 
      end
        
    else
      begin
      y=16'bz;
      end
        
    trans.out = y;
    
    if(y===trans.out)
    
        p="Test pass";
    else
      begin
      p="Test fail";
      end
    
    
    
        trans.display({"Scoreboard ",p});
        
      end
  endtask
endclass
