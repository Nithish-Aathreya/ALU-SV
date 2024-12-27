module alu(a,b,enable,command,out);
  input [7:0]a,b;
  input enable;
  input [3:0]command;
  output reg [31:0]out;
  reg [31:0]y;
  
  parameter add=4'b0000,sub=4'b0001,mul=4'b0010,div=4'b0011,AND=4'b0100,
  			OR=4'b0101,NAND=4'b0110,NOR=4'b0111,XOR=4'b1000,XNOR=4'b1001;
  
  always @(*)
    begin
      
      case(command)     
        add:y=a+b;
        sub:y=a-b;
        mul:y=a*b;
        div:y=a/b;
        AND:y=a&b;
        OR:y=a | b;
        NAND:y= ~(a&b);
        NOR:y= ~(a|b);
        XOR:y= a^b;
        XNOR:y=~(a^b);
        default:y=16'b0;
        endcase
      end 
        
  always @(*)
    begin
        if(enable ==1'b1)
        out = y;
        else 
         out=16'bz;
    end
        endmodule
