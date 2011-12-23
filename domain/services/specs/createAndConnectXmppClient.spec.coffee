#>> Setup

createAndConnectXmppClient = require '../createAndConnectXmppClient'

#>> When I create an xmppClient

xmppClient = 
  createAndConnectXmppClient
    host: "telefonica115.orl.voxeo.net"
    jabberId: "wearefractal@jabber.org"
    jabberPass: "ill4jabber"
    verbose: true
    status: "I'm online"

#>> Then When It connects

xmppClient.on 'online', -> 

#>> it should be ok

  xmppClient.should.be. ok

#>> Cleanup
  
  xmppClient.end() 
