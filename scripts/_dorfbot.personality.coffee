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

dorfbotUtils = require('./_dorfbot.utils')

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

# Band name phrase array
bandNamePhrases = ["\"$0\" would be a great name for a band.",
                   "\"$0\" is an awesome band name.",
                   "\"$0\" would totally rock for a band name.",
                   "\"$0\" sounds like a sweet name for a band.",
                   "You guys know what would be a great name for a band? \"$0\"",
                   "\"$0\" sounds like one of those new age bands.",
                   "\"$0\" sounds like a band from the 90's."
                  ]

# You know who else is an array of strings? MY MOM!
myMom = ["My mom!",
         "MY MOM!",
         "Your mom!",
         "YOUR MOM!",
         "Your mom!\nhttp://www.wikiwand.com/en/List_of_burn_centers_in_the_United_States",
         "https://38.media.tumblr.com/tumblr_m60268QUxC1rz0r9wo1_500.gif"
        ]

# OOOHHHHHH!!!
regularShoohhhArray = ["http://airsi.de/img/oohhh/Cuties+Fanart.gif",
                       "http://airsi.de/img/oohhh/Ducklings.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Ducklings.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Rigby+Ducklings.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Rigby.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Rigby-2.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Rigby-3.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Rigby-4.gif",
                       "http://airsi.de/img/oohhh/Mordecai+Rigby-rolling-out.gif",
                       "https://33.media.tumblr.com/tumblr_mb646m565Z1rhxn6ro1_500.gif",
                       "http://25.media.tumblr.com/6c2d951985f1e43cd2915738ee91aa3d/tumblr_mjuiwzRboL1rn2utdo3_500.gif"
                      ]

# the "brain"
module.exports = (robot) ->
    dorfbot = new dorfbotUtils robot

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
# uses dorfbotGreetings array
    robot.hear /(hey|yo|hi|hello|what\'s up|what up)\,? dorfbot/i, (msg) ->
        msg.reply msg.random dorfbotGreetings

# SETTLE IT IN SMASH!
    robot.hear /fighting words/i, (msg) ->
        msg.send "SETTLE IT IN SMASH!"

# Tell dorfbot he is slow, he'll respond late
# Pulled from example
    robot.respond /(?:you are|you're) (?:a little)? slow/i, (msg) ->
        setTimeout () ->
          msg.send "Who you calling 'slow'?"
        , 60 * 1000

# Will randomly reply to anything, THAT'S WHAT SHE SAID
    robot.hear /.*/, (msg) ->
        if dorfbot.ignoreListen(msg.message)
            return
            
        random = Math.floor(Math.random() * 500)
        if random == 0
            msg.send "THAT'S WHAT SHE SAID!"
            return

# And a Star Wars
    robot.respond /execute order 66/i, (msg) ->
        msg.send "_kills the younglings_"

# That'd be a great band name
    robot.hear /^([\w\?\!\,\.]+ [\w\?\!\,\.]+(?: [\w\?\!\,\.]+)?(?: [\w\?\!\,\.]+)?)$/i, (msg) ->
        if dorfbot.ignoreListen(msg.message)
            return
        
        random = Math.floor(Math.random() * 50)
        if random == 0
            msg.send dorfbot.templateString(msg.match[1], msg.random bandNamePhrases)
            return

# Channeling inner muscle man
    robot.hear /^you know who else (.*)\?$/i, (msg) ->
        msg.send msg.random myMom

# Regular Show "OOHHHHH"
    robot.hear /^o+h{3,}!*$/i, (msg) ->
        msg.send msg.random regularShoohhhArray
