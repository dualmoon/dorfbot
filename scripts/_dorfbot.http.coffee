# dorfbot http endpoints
engines = require 'consolidate'

module.exports = (robot) ->
  robot.router.engine 'mustache', engines.mustache 

  robot.router.get '/', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    res.render "index.mustache", {name: robot.name}

  robot.router.get '/cmd/echo', (req, res) ->
    string = "No text sent"
    string = req.param('text') if req.param('text')
    res.status(200).end()
    robot.messageRoom req.param('channel_id'), "#{string}"
