@echo off

npm install && npm uninstall hubot airbot && npm install airbot --save && node_modules\.bin\hubot.cmd %* 