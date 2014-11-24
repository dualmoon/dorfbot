# Description:
#   Converts short hand for subreddits and reddit users into full urls
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   sprngr

module.exports = (robot) ->

    robot.hear /\/?r\/(.*)/i, (msg) ->
        if msg.message.indexOf("reddit.com") != -1
            return

        msg.send "http://reddit.com/r/"+msg.match[1]
