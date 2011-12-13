#>> Setup

_ = require 'slice'
should = _.load 'should'
createAndConnectXmppClient = _.load 'services.createAndConnectXmppClient'

#>> When I create an xmppClient

xmppClient = 
  createAndConnectXmppClient
    host: "telefonica115.orl.voxeo.net"
    jabberId: "wearefractal@jabber.org"
    jabberPass: "ill4jabber"
    verbose: true
    status: "I'm online"

#>> Then

xmppClient.on "online", -> 
  xmppClient.should.be.ok
  xmppClient.end()


