_ = require 'slice'
xmpp = _.load 'node-xmpp'


connectXmppClient = (connection) ->

  # connects on creation

  return new xmpp.Client
    jid: connection.jabberId
    password: connection.jabberPass
    host: connection.server
    port: connection.port


module.exports = connectXmppClient

