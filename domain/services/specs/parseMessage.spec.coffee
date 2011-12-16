#>> Setup

_ = require('slice') __dirname
should = _.load 'should'
xmpp = _.load 'node-xmpp'
createMessage = _.load 'services.parseMessage'

#>> Given an XML LTX message

msg = xmpp.parse '<animals type="pets" test="yeah"><dog type="dumb"><name>Rufus</name><breed>labrador</breed></dog><dog><name>Marty</name><breed>whippet</breed></dog><dog/><cat name="Matilda"/></animals>'

#>> When I call parseMessage

obj = parseMessage msg

#>> Then

JSON.stringify(obj).should.equal JSON.stringify {"animals":{"@type":"pets","@test":"yeah","dog":[{"@type":"dumb","name":"Rufus","breed":"labrador"},{"name":"Marty","breed":"whippet"},null],"cat":{"@name":"Matilda"}}}
