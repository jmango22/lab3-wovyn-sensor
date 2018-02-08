// click on a ruleset name to see its source here
ruleset wovyn_base {
  meta {
    name "Wovyn Base"
    description <<
    Base for the first lab with the Wovyn sensor
>>
    author "Jon Meng"
    logging on
    shares hello
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
  
  rule process_heartbeat {
    select when echo heartbeat
    send_directive("say", {"something": "Processed Heartbeat"})
  }
  
  rule hello_monkey {
    select when wovyn monkey
    pre{
      //name = event:attr("name").defaultsTo("Monkey").klog("our passed in name: ")
      name = (event:attr("name") != null) => (event:attr("name")) | "Monkey"
    }
    send_directive("say", {"something": "Hello "+name})
  }
  
}
