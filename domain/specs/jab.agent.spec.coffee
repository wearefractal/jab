#>> Setup

_ = require 'slice'
should = _.load 'should'
Jab = require '../jab.agent'

#>> When I try to create a jab client with no connection

try jabClient = new Jab() 
catch error 
  error.message.should.equal "jab: connection details not defined"

#>> When I create a valid connection

jabClient = new Jab
  host: "telefonica115.orl.voxeo.net"
  jabberId: "wearefractal@jabber.org"
  jabberPass: "ill4jabber"
  verbose: true
  status: "I'm online"

#>> Then it should be created ok

jabClient.should.be.ok

#>> When I try to connect it

jabClient.connect()

#>> Then it should be ok when it connects

jabClient.on "connected", -> 

  jabClient.should.be.ok
  jabClient.disconnect()


