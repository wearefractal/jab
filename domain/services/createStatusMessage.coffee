_ = require 'slice'
xmpp = _.load 'node-xmpp'

createStatusMessage = (status) ->

  return new xmpp.Element('presence').c('show').t('chat').up().c('status').t(status)


module.exports = createStatusMessage
