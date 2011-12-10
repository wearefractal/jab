handleStanzaError = (stanza, connection) ->

  callback = connection.messageQueue.call stanza.attrs

  if isFunction callback

    if stanza.children
      err = (child for child in stanza.children when child.name is 'error')[0]
      if err
        msg = (child for child in err.children when child.name is 'text')[0].children[0]
        return callback new Error "Type: #{ err.attrs.type }, Message: #{ msg }"
      else if stanza.children and stanza.children[0].children
        return callback new Error stanza.children[0].children[0].name
    else
      return callback new Error "Generic Error! Stanza: #{ stanza }"
  else
    console.log 'UNHANDLED ERROR! - ' + stanza


module.exports = handleStanzaError

