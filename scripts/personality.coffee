# basic reponses to give dorfbot personality

module.exports = (robot) ->
    robot.hear /good dorfbot/i, (msg) ->
        msg.reply "☺"
