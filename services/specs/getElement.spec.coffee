>> Setup

  _ = require 'slice'
  getElement = _.load 'xmpp.services.getElement'
  Message = _.load 'xmpp.models.Message'

>> Given a sample Message

  message = new Message
    rootName: "presence"
    rootAttributes:
      from : "d1ac9dac-be38-498a-ac8d-d006a5b4cf9c@telefonica115.orl.voxeo.net"
      to : "wearefractal@jabber.org"
      id : "e4314e78-818a-44f0-a769-e8fd9be4eb3c"
      xmlns : "jabber:client"
      xmlns:stream : "http://etherx.jabber.org/streams"
    childName: "end"

>> When I call getElement

  element = getElement message, "telefonica115.orl.voxeo.net", "wearefractal@jabber.org"

>> Then the element should be properly scaffolded

  message.rootName.should.eql "presence"
  id = message.getId()
  id.should.equal "e4314e78-818a-44f0-a769-e8fd9be4eb3c"

