@echo off

npm install && npm uninstall hubot airbot && npm install airbot && node_modules\.bin\hubot.cmd %* 