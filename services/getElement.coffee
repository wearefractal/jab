_ = require 'slice'
xmpp = _.load 'node-xmpp'

getElement = (message, server, jid) ->

  if message.rootAttributes.to.indexOf '$callserver' > 0

    message.rootAttributes.to = message.rootAttributes.to.replace '$callserver', server

    if message.rootAttributes.from is "#{ jid.user }@#{ jid.domain }" or "$localuser"
      message.rootAttributes.from = "#{ jid.user }@#{ jid.domain }/#{ jid.resource }"

    el = new xmpp.Element message.rootName, message.rootAttributes
    sub = el.c message.childName, message.childAttributes
    sub.c(child) for child in message.children
    # If we have headers, append all of them
    sub.c('header', {name: head, value: message.sipHeaders[head]}) for head of message.sipHeaders
    return el


module.exports = getElement

