>> Setup

  _ = require 'slice'
  getRandomId = _.load 'xmpp.services.getRandomId'

>> When I create two Ids

  result = getRandomId()
  result2 = getRandomId()

>> Then the results should be a random strings in the correct format

  # TODO: pattern match
  result.should.be.a "string"

>> And the two results should be different

  result2.should.not.equal result

