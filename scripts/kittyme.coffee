# Description:
#   Kittyme is the other most important thing in your life
#
# Commands:
#   hubot kitty me - Receive a kitty
#   hubot kitty bomb N - get N kitties

module.exports = (robot) ->
  
  re = /src="([^"]+)"/g
  catURL = "http://thecatapi.com/api/images/get?format=html"
  
  robot.respond /kitty me/i, (msg) ->
    msg.http(catURL)
      .get() (err, res, body) ->
        msg.send re.exec(body)[1]

  robot.respond /kitty bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.http(catURL+"&results_per_page="+count)
      .get() (err, res, body) ->
        while (i=re.exec(body)) != null
          msg.send i[1]
