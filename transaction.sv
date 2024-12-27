class transaction;
    rand logic [7:0]a,b;
  rand logic enable;
   rand logic [3:0]command;
 logic [15:0]out;
 logic[15:0]y;
  
  function void display(string name); 
    $display("%s",name);
    $display("a=%d,b=%d,command=%d,enable=%d,out=%d",a,b,command,enable,out);
  endfunction
endclass
