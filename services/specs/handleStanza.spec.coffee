>> Setup

  _ = require 'slice'
  handleStanza = _.load 'xmpp.services.handleStanza'

>> Given stanza and connection samples

  stanza = _.sample 'xmpp.models.Stanza'
  connection = _.sample 'connection.models.Connection'

>> When I call handleStanza

  handleStanza stanza, connection

>> Then

  connection.commandQueue.shift().should.etc

