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
    shares __testing
  }

  global {
    __testing = { "queries": [ { "name": "__testing" } ],
                  "events": [ { "domain": "post", "type": "test",
                              "attrs": [ "temp", "baro" ] } ] }
  }
  
  rule process_heartbeat {
    select when echo heartbeat
    pre {
      never_used = event:attrs().klog("attrs")
    }
    send_directive("say", {"something": "Processed Heartbeat"})
  }
 
}
