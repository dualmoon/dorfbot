# basic reponses to give dorfbot personality

module.exports = (robot) ->
    robot.hear /good dorfbot/i, (msg) ->
        msg.send "\uD83D\uDE0A" #sweet smile emote
