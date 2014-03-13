# Description:
#   Get the server uptime for the server Hubot is running on.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot server uptime - Returns the Hubot host server's uptime.
#
# Author:
#   Geoffrey Brodniak
#

{spawn} = require 'child_process'
module.exports = (robot) ->
    robot.respond /server uptime/i, (msg) ->
        command = spawn 'uptime', [] 
        command.stdout.on 'data', (data) -> msg.send data.toString()
        command.stderr.on 'data', (data) -> msg.send data.toString()
