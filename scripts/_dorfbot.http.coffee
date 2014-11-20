# dorfbot http endpoints

module.exports = (robot) ->
  robot.router.get '/', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    res.end "derp"
