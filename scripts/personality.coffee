# Description:
#   Interaction to give dorfbot some sort of personality
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
#   dualmoon, sprngr

# The responses are all based off of strings heard, don't want to flood the commands list

# Greetings array
dorfbotGreetings = ["Oh hey!",
                    "What's up?", 
                    "I missed you ;_;", 
                    "I found this adorable kitty! http://i.imgur.com/R8en7.jpg",
                    "Word to your mother.",
                    "¡Bienvenido!",
                    "こんにちは *bows*"
                   ]

# the "brain"
module.exports = (robot) ->
 
# "Good dorfbot"
    robot.hear /good dorfbot/i, (msg) ->
        msg.send "\uD83D\uDE0A" #sweet smile emote

# because I keep misspelling his name - dorf
    robot.hear /.*dorbot.*/i, (msg) ->
        msg.reply "Dammit, I'm not doing shit for you til you get my name right."

# "dorfbot do something"
    robot.respond /do something/i, (msg) ->
        msg.send "I don't wanna"

# general responses for someone saing "hey, hi, yo, etc" to dorfbot
    robot.hear /(hey|yo|hi|hello|what\'s up|what up)\,? dorfbot/i, (msg) ->
        msg.reply msg.random dorfbotGreetings

