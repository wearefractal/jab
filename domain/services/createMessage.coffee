_ = require('slice') __dirname
xmpp = _.load 'node-xmpp'
xmlson = _.load 'xmlson'

createMessage = (message) ->
  return message if message instanceof xmpp.Element
  return xmlson.toXML(message) if typeof message is 'object'
  return xmpp.parse(message) if typeof message is 'string'
  throw new Error 'Invalid object for message'

module.exports = createMessage

