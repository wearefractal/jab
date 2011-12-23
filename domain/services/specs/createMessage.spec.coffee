#>> Setup

createMessage = require '../createMessage'

#>> Given an outgoing message object

obj = {"presence":{"@to":"16577@app.rayo.net/1","@from":"9f00061@call.rayo.net/1","offer":{"@xmlns":"urn:xmpp:rayo:1","@to":"tel:+18003211212","@from":"tel:+13058881212","header":[{"@name":"Via","@value":"192.168.0.1"},{"@name":"Contact","@value":"192.168.0.1"}]}}}

#>> When I call createMessage

msg = createMessage obj

#>> Then

msg.toString().should.equal '<presence to="16577@app.rayo.net/1" from="9f00061@call.rayo.net/1"><offer xmlns="urn:xmpp:rayo:1" to="tel:+18003211212" from="tel:+13058881212"><header name="Via" value="192.168.0.1"/><header name="Contact" value="192.168.0.1"/></offer></presence>'

