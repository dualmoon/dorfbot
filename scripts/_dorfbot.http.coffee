# dorfbot http endpoints

module.exports = (robot) ->

  rootContents = 

    """
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8">
    <title>{name}</title>
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
    <h1>{name}</h1>
    <img src="{stat}"/>
    </body>
    </html>
    """

    robot.router.get '/', (req, res) ->

      res.setHeader 'content-type', 'text/html'
      res.end rootContents
      