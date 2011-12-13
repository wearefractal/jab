#>> Setup

_ = require 'slice'
should = _.load 'should'
createStatusMessage = _.load 'services.createStatusMessage'

#>> Given a status

status = "I'm in the house"

#>> When I call createStatusMessage

msg = createStatusMessage status

#>> Then

msg.children[0].should.equal "I'm in the house"
