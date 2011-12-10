_ = require 'slice'

getMessage        = _.load 'xmpp.services.getMessage'
handleStanzaError = _.load 'xmpp.services.handleStanzaError'


handleStanza = (stanza, connection) ->

  if connection.xmppClient.verbose
    console.log 'Receiving inbound message: ' + stanza

  if stanza.attrs.type is 'error'
    return handleStanzaError stanza, connection

  message = getMessage stanza
  connection.commandQueue.call message


module.exports = handleStanza

