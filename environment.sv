`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;
  mailbox m1;              //gen2driv
  mailbox m2;             //mon2scb
virtual intf vif;
  
  function new (virtual intf vif);
    this.vif = vif;
     m1 = new();
    m2 = new();
    gen = new(m1);
    driv = new(m1,vif);
    mon = new(m2,vif);
    scb = new(m2);
   
  endfunction
  
  task test();
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();  
    join
  endtask
  
  task run();
  begin
  test();
  $finish;
  end
    endtask
    endclass
