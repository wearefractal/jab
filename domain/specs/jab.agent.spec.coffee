#>> Setup

path = require 'path'
_ = require('slice') sandbox.__dirname

Jab = require (path.resolve _.domainRoot, 'jab.agent')

#>> When I create a valid connection

jabClient = new Jab
  host: "telefonica115.orl.voxeo.net"
  jabberId: "wearefractal@jabber.org"
  jabberPass: "ill4jabber"
  verbose: true
  status: "I'm online"

#>> Then it should be created ok

jabClient.should.be.ok

#>> When I to connect it

jabClient.connect()

#>> And it connects 

jabClient.on "connected", -> 

#>> Then it should be ok

  jabClient.should.be.ok

#>> Cleanup

  jabClient.disconnect()


