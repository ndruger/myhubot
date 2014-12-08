
module.exports = (robot) ->
  robot.hear /test(.*)/i, (msg) ->
    msg.send "hear #{msg.match[1]}"

  robot.respond /test(.*)/i, (msg) ->
    msg.send "respond #{msg.match[1]}"
