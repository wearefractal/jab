_ = require('slice') __dirname
xmlson = _.load 'xmlson'

parseMessage = (message) -> xmlson.toJSON message

module.exports = parseMessage

