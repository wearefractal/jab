xmlson = require 'xmlson'

parseMessage = (message) -> xmlson.toJSON message

module.exports = parseMessage

