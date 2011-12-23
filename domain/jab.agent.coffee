{EventEmitter} = require 'events'
createAndConnectXmppClient = require './services/createAndConnectXmppClient'
createMessage = require './services/createMessage'
parseMessage = require './services/parseMessage'

class JabAgent extends EventEmitter

  constructor: (@connection) ->
    throw new Error "jab: connection details not defined" unless @connection?
 
  connect: ->
    @xmppClient = createAndConnectXmppClient @connection

    # online
    @xmppClient.on 'online', =>
      @connected = true
      @emit 'connected'
      @ping() if @connection.ping
      
      # stanza handler
      @xmppClient.on 'stanza', (stanza) => 
        console.log "IN: #{stanza.toString()}" if @connection.debug
        @emit 'stanza', parseMessage stanza

    # offline
    @xmppClient.on 'offline', =>
      @connected = false
      @emit 'disconnected'

    # error
    @xmppClient.on 'authFail', (err) => @emit 'error', err
    @xmppClient.on 'error', (err) => @emit 'error', err if err?
    
  send: (message) -> 
    console.log "OUT: #{createMessage(message).toString()}" if @connection.debug
    @xmppClient.send createMessage message
    
  disconnect: -> @xmppClient.end()  
  
  # Send XMPP PING (XEP-0199)
  ping: ->
    @send iq: '@from': @xmppClient.jid.toString(), '@to': @xmppClient.jid.domain, '@type': 'get', ping: '@xmlns': 'urn:xmpp:ping'
    
module.exports = JabAgent
