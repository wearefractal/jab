#>> Setup

path = require 'path'
_ = require('slice') sandbox.__dirname

parseMessage = _.load 'services.parseMessage'

#>> Given an XML message

msg = "<presence to='16577@app.rayo.net/1' from='9f00061@call.rayo.net/1'><offer xmlns='urn:xmpp:rayo:1' to='tel:+18003211212' from='tel:+13058881212'><header name='Via' value='192.168.0.1'/><header name='Contact' value='192.168.0.1'/></offer></presence>"

#>> When I call parseMessage

obj = parseMessage msg

#>> Then

JSON.stringify(obj).should.equal JSON.stringify {"presence":{"@to":"16577@app.rayo.net/1","@from":"9f00061@call.rayo.net/1","offer":{"@xmlns":"urn:xmpp:rayo:1","@to":"tel:+18003211212","@from":"tel:+13058881212","header":[{"@name":"Via","@value":"192.168.0.1"},{"@name":"Contact","@value":"192.168.0.1"}]}}}
