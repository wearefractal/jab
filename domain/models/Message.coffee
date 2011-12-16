_ = require('slice') __dirname
config = _.load 'command.config'
getRandomId = _.load 'xmpp.services.getRandomId'
getElement = _.load 'xmpp.services.getElement'

class Message
  constructor: ({@rootName, @rootAttributes, @childName, @childAttributes, @sipHeaders, @children}) ->
    throw new Error 'Missing rootName' unless @rootName
    throw new Error 'Missing childName' unless @childName
    @childAttributes ?= {}
    @rootAttributes ?= {}
    @sipHeaders ?= {}
    @children ?= []
    if @rootName is 'iq' then @rootAttributes.type ?= 'set'
    @rootAttributes.id ?= getRandomId()
    @childAttributes.xmlns ?= config.xmlns

  getId: -> return @rootAttributes.id
  getElement: (server, jid) -> getElement server, jid, @


module.exports = Message

