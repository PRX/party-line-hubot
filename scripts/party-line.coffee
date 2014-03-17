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
    if (robot.adapter.client.roster)
      text = "#{msg.message.user.id}: #{msg.message.text}"

      for jid in robot.adapter.client.roster
        if msg.message.user.id != jid.user
          robot.logger.info "Sending to #{jid.user}"

          params =
            to: jid.toString()
            type: 'chat'

          message = new Xmpp.Element('message', params).c('body').t(text)
          robot.adapter.client.send message
