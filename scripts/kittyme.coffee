# Description:
#   Kittyme is the other most important thing in your life
#
# Commands:
#   hubot kitty me - Receive a kitty
#   hubot kitty bomb N - get N kitties

module.exports = (robot) ->

  robot.respond /kitty me/i, (msg) ->
    re = /src="([^"]+)"/g
    msg.http("http://thecatapi.com/api/images/get?format=html")
      .get() (err, res, body) ->
        msg.send re.exec(body)[1]
