>> Setup

  _ = require 'slice'
  getMessage = _.load 'xmpp.services.getMessage'

>> Given a sample stanza

  stanza = _.sample 'xmpp.models.Stanza'

>> When I call getMessage

  message = getMessage stanza

>> Then it should return a properly build message

  message.should.blah

