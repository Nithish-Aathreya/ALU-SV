class monitor;
  mailbox mon2scb;
  transaction trans;
   virtual intf vif;
  
   function new( mailbox mon2scb, virtual intf vif);
    this.mon2scb=mon2scb;
    this.vif=vif;
  endfunction
  
  task main();
    repeat(1)
    begin
      trans = new();
      trans.a=vif.a;
      trans.b=vif.b;
      trans.enable=vif.enable;
      trans.command=vif.command;
      trans.out=vif.out;
      mon2scb.put(trans);
      trans.display("Monitor");
    end
  endtask
endclass
