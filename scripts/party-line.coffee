# Description:
#   Set up an XMPP party line
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None

Xmpp = require 'node-xmpp'

module.exports = (robot) ->
  robot.catchAll (msg) ->
    from = new Xmpp.JID(msg.message.room)
    text = "#{from.user}: #{msg.message.text}"

    for jid in robot.xmppRoster
      if from.user != jid.user
        params =
          to: jid.toString()
          type: 'chat'

        message = new Xmpp.Element('message', params).c('body').t(text)
        robot.xmppClient.send message
