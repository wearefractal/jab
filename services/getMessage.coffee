_ = require 'slice'
Message = _.load 'xmpp.models.Message'


getMessage = (stanza) ->

    child = stanza.children[0]

    if child
      head = {}
      childs = {}
      head[x.attrs.name] = x.attrs.value for x in child.children when x.name is 'header'
      childs[x.name] = x.attrs for x in child.children when x.name != 'header'

      message = new Message
        rootName: stanza.name
        rootAttributes: stanza.attrs
        childName: child.name
        childAttributes: child.attrs
        sipHeaders: head
        children: childs

    else
      message = new Message
        rootName: stanza.name
        rootAttributes: stanza.attrs
        childName: stanza.type

    return message


module.exports = getMessage

