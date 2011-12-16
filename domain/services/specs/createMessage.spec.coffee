#>> Setup

_ = require 'slice'
should = _.load 'should'
createMessage = _.load 'services.createMessage'

console.log createMessage

###
#>> Given an object

obj = {"animals":{"@type":"pets","@test":"yeah","dog":[{"@type":"dumb","name":"Rufus","breed":"labrador"},{"name":"Marty","breed":"whippet"},null],"cat":{"@name":"Matilda"}}}

#>> When I call createMessage

msg = createMessage obj

#>> Then

msg.toString().should.equal '<animals type="pets" test="yeah"><dog type="dumb"><name>Rufus</name><breed>labrador</breed></dog><dog><name>Marty</name><breed>whippet</breed></dog><dog/><cat name="Matilda"/></animals>'
