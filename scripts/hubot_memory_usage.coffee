# Description:
#   Get the memory and cpu footprint of the Hubot instance.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot resource usage
#
# Author:
#   Geoffrey Brodniak
#
{spawn,exec} = require 'child_process'
module.exports = (robot) ->
    robot.respond /resource usage/i, (msg) ->
        command = exec "ps auxww |grep [h]ubot |awk \'{ print $4 }\'"
        command.stdout.on 'data', (data) -> msg.send "I am using on average #{data.toString().trim()}% of the memory on this machine."
        command = exec "ps auxww |grep [h]ubot |awk \'{print $3 } \'"
        command.stdout.on 'data', (data) -> msg.send "I am currently using #{data.toString().trim()}% of the cpu on this machine."
