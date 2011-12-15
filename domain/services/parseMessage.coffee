_ = require 'slice'
xmlson = _.load 'xmlson'

parseMessage = (message) -> xmlson.toJSON message

module.exports = parseMessage

