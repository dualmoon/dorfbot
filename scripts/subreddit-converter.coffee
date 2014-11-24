# Description:
#   Converts short hand for subreddits and reddit users into full urls if
#   mentioned in chat
#
# Dependencies:
#   "request" : "2.48.0"
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   sprngr

request = require 'request'

module.exports = (robot) ->

# Converts to subreddit url
    robot.hear /\/?r\/(.*)/i, (msg) ->
        urlString = msg.message.toString()
        
        if urlString.indexOf("reddit.com") != -1
            return
        
        location = "http://reddit.com/r/"+msg.match[1]+"/about.json"
        
        request.get location, (err, res, body) ->
            if JSON.parse(body).error == 404
                return

            title = JSON.parse(body).data.url
            subUrl = JSON.parse(body).data.url
            desc = JSON.parse(body).data.public_description

            unless subUrl?
                return

            msg.send "#{title} - #{desc}\nhttp://reddit.com#{subUrl}"

# Converts to reddit user link
    robot.hear /\/?u\/(.*)/i, (msg) ->
        urlString = msg.message.toString()
        if urlString.indexOf("reddit.com") != -1
            return

        location = "http://reddit.com/u/"+msg.match[1]+"/about.json"

        request.get location, (err, res, body) ->
            if JSON.parse(body).error == 404
                return

            name = JSON.parse(body).data.name

            unless subUrl?
                return

            msg.send "#{name} - http://reddit.com/u/#{name}"


