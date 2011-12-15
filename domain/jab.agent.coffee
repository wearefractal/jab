_ = require 'slice'
EventEmitter = _.load('events').EventEmitter
createAndConnectXmppClient = _.load 'services.createAndConnectXmppClient'
createMessage = _.load 'services.createMessage'

class JabAgent extends EventEmitter

  constructor: (@connection) ->
    throw new Error "jab: connection details not defined" unless @connection?
 
  connect: ->
    @xmppClient = createAndConnectXmppClient @connection

    # online
    @xmppClient.on 'online', =>
      @connected = true
      @emit 'connected'
      # stanza handler
      @xmppClient.on 'stanza', (stanza) => @emit 'stanza', stanza

    # offline
    @xmppClient.on 'offline', =>
      @connected = false
      @emit 'disconnected'

    # error
    @xmppClient.on 'authFail', (err) => @emit 'error', err
    @xmppClient.on 'error', (err) => @emit 'error', err

  send: (message) -> @xmppClient.send createMessage message
  disconnect: -> @xmppClient.end()  


module.exports = JabAgent
