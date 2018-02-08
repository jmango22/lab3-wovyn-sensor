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
  
  rule process_heartbeat {
    select when echo heartbeat
    send_directive("say", {"something": "Processed Heartbeat"})
  }
}
