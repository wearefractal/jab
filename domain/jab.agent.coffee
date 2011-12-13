_ = require 'slice'
EventEmitter = _.load('events').EventEmitter
createAndConnectXmppClient = _.load 'services.createAndConnectXmppClient'
createStatusMessage = _.load 'services.createStatusMessage'

class JabAgent extends EventEmitter

  constructor: (@connection) ->
    # connection: {@host, @port, @jabberId, @jabberPass, @verbose, @status}
    if !@connection? 
      throw new Error "jab: connection details not defined"
 
  connect: ->

    @xmppClient = createAndConnectXmppClient @connection

    # online
    @xmppClient.on 'online', =>
 
      @connected = true
      @emit 'connected'
      if @connection.status?
        @setStatus @xmppClient, @connection.status

      # stanza 
      @xmppClient.on 'stanza', (stanza) => @emit 'stanza', stanza

    # offline
    @xmppClient.on 'offline', =>
      @connected = false
      @emit 'disconnected'

    # error
    @xmppClient.on 'authFail', (err) => @emit 'error', err
    @xmppClient.on 'error', (err) => @emit 'error', err

  setStatus: (status) -> @xmppClient.send createStatusMessage status
  send: (message) -> @xmppClient.send message
  disconnect: -> @xmppClient.end()  


module.exports = JabAgent
