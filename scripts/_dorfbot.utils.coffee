class DorfbotUtils
    constructor: (@robot) ->
        return

    isCommand: (string) ->
        string = string.toString()

        if string.indexOf("/") == 0
            return true

    containsBotName: (string) ->
        string = string.toString()

        if string.toLowerCase().indexOf(@robot.name) != -1
            return true

    # used to ignore strings picked up that contain dorfbot or are /commands
    ignoreListen: (string) ->
        if this.containsBotName(string) || this.isCommand(string)
            return true

    # TODO: value -> Array, iterate over and try to match $i in target string
    # will need to expand upon for more ordinal replacement values
    templateString: (value, target) ->
        return target.replace("$0", value)


module.exports = DorfbotUtils