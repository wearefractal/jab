_ = require 'slice'
EventEmitter = _.load('events').EventEmitter

class JabClient extends EventEmitter
  constructor: (args) ->
    @callbackQueue = []
  connect: ->
  disconnect: ->
  send: (el) ->


module.exports = JabClient

