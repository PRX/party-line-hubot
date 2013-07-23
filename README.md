# PRX Staff Chat Hubot

This is a version of GitHub's Campfire bot, hubot. He's pretty cool.

This version is designed to be deployed on [Heroku][heroku].

[heroku]: http://www.heroku.com

This Hubot was built to help small groups stay in touch. Any messages he receives will be relayed to rest of the group.

You'll need to install the necessary dependencies for hubot. All of
those dependencies are provided by [npm][npmjs].

[npmjs]: http://npmjs.org

## Party Line

Party-Line is the Hubot script that is responsible for relaying messages. Every time a message is sent to the Hubot, the Hubot will re-send the message to group members, as individual messages. The original sender's name is appended to the beginning of the messages that get relayed.

Party-Line relies on `hubot-xmpp`, but it will ***not*** work with the standard version. It needs a patched version that has access to user rosters. It can be found at `git://github.com/PRX/hubot-xmpp.git`. This library will get and store the user's roster when it connects. This allows party-line to have a list of users to relay messages to without needing anything outside of XMPP itself.

It's important to remember that the roster is only loaded when Hubot connects, so if the roster changes, it will need to reconnect.

## Setup

When deploying to Heroku, be sure to set the following environment configs.

    HEROKU_URL:          http://my-app-name.herokuapp.com
    HUBOT_XMPP_HOST:     xmpp.example.com
    HUBOT_XMPP_PASSWORD: password123ABC
    HUBOT_XMPP_PORT:     5222
    HUBOT_XMPP_USERNAME: chat@xmpp.example.com
    

