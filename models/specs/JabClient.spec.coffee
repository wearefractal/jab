>> Given a mock connection object

  mockConnection =
    host : "localhost"
    port : "8080"
    jabberId : "wearefractal@jabber.org"
    jabberPass : "boo"
    verbose : false

>> When we try to make an JabClient

  client = new JabClient mockConnection

>> Then we have a fully wired up xmpp client ready to listen and emit events

  client.xmppClient.host.should.eql "localhost"
  client.xmppClient.port.should.eql "8080"
  client.xmppClient.jabberId.should.eql "wearefractal@jabber.org"
  client.xmppClient.jabberPass.should.eql "jabberPass"

