# dorfbot http endpoints

rootContents = (name, stat) ->
  """
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="utf-8">
  <title>#{name}</title>
  <style type="text/css">
  body {
   background: #d3d6d9;
   color: #636c75;
   text-shadow: 0 1px 1px rgba(255, 255, 255, .5);
   font-family: Helvetica, Arial, sans-serif;
  }
  h1 {
   margin: 8px 0;
   padding: 0;
  }
  .commands {
   font-size: 13px;
  }
  p {
   border-bottom: 1px solid #eee;
   margin: 6px 0 0 0;
   padding-bottom: 5px;
  }
  p:last-child {
   border: 0;
  }
  </style>
  </head>
  <body>
  <h1>#{name}</h1>
  <img src="#{stat}assets/dorfbot.png"/>
  </body>
  </html>
  """

module.exports = (robot) ->

  robot.router.get '/', (req, res) ->

    stat = process.env.GITHUB_MASTER_RAW

    res.setHeader 'content-type', 'text/html'
    res.end rootContents robot.name, stat

  robot.router.get '/cmd/echo', (req, res) ->
    string = "No text sent"
    string = req.param('text') if req.param('text')

    res.send "param channel_name is: #{req.param 'channel_name'}, param user_name is: #{req.param 'user_name'}, string is: #{string}"

#  robot.router.post '/cmd/echo/loud', (req, res) ->
#    string = "No text sent"
#    string = req.param('text') if req.param('text')
#    
#    res.status(200).end()
#    robot.messageRoom