class driver;
  transaction trans;
  virtual intf vif;
  mailbox gen2driv;
  
  function new( mailbox gen2driv, virtual intf vif);
    this.gen2driv=gen2driv;
    this.vif=vif;
  endfunction
  
  
  task main();
    repeat(1)
    begin
      gen2driv.get(trans);
      vif.a=trans.a;
       vif.b=trans.b;
       vif.enable=trans.enable;
       vif.command=trans.command;
       trans.out=vif.out;
      trans.display("Driver");
    end
  endtask
endclass
