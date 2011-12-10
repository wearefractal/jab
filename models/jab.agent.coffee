_ = require 'slice'
EventEmitter  = _.load('events').EventEmitter
default       = _.load 'connection.config'
setStatus     = _.load 'xmpp.services.setStatus'
parseHost     = _.load 'connection.services.parseHost' # move to xmpp

class JabAgent extends EventEmitter

# constructor: ({@host, @port, @jabberId, @jabberPass, @verbose, @status}) ->
 constructor: (connection) ->

    @connection = createConnection connection    

#    @status ?= default.status
#    @verbose ?= defualt.verbose
#    {@host, @port} = parseHost @host, @port

  connect: ->

    @xmppClient = createXMPPClient @connection

    # online
    @xmppClient.on 'online', =>
      @connected = true
      @emit 'connected'
      setStatus @xmppClient, @status

      @xmppClient.on 'stanza', (stanza) =>
        @emit 'stanza', stanza

    # offline
    @xmppClient.on 'offline', =>
      @connected = false
      @emit 'disconnected'

    # error
    @xmppClient.on 'authFail', (err) => @emit 'error', err
    @xmppClient.on 'error', (err) => @emit 'error', err

  disconnect: -> @xmppClient.end()
  send: (element) -> @xmppClient.send element


module.exports = JabClient

