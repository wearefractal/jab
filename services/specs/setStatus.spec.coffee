>> Setup

  _ = require 'slice'
  setStatus = _.load 'xmpp.services.setStatus'

>> Given a mock client

  client =
    send: (@element) ->

>> When I call setStatus

  setStatus "I am mockingly online", client

>> Then

  status = client.element.children.shift()
  status.should.equal "I am mockingly online"

