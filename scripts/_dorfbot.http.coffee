# dorfbot http endpoints

module.exports = (robot) ->
  robot.router.post '/', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    res.end "derp"
    