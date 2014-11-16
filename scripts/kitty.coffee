module.exports = (robot) ->
    robot.respond /kitty/i, (msg) ->
        msg.emote "gives you a kitty"