_ = require 'slice'
xmpp = _.load 'node-xmpp'


setStatus = (status, client) ->

  client.send new xmpp.Element('presence').c('show').t('chat').up().c('status').t(status)


module.exports = setStatus

