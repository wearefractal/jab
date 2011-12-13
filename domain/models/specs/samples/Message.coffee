_ = require 'slice'
Message = _.load 'xmpp.models.Message'

message =
    new Message
      rootName: "presence"
      rootAttributes:
        from : "d1ac9dac-be38-498a-ac8d-d006a5b4cf9c@telefonica115.orl.voxeo.net"
        to : "wearefractal@jabber.org"
        id : "e4314e78-818a-44f0-a769-e8fd9be4eb3c"
        xmlns : "jabber:client"
        xmlns:stream : "http://etherx.jabber.org/streams"
      childName: "end"


module.exports = message

