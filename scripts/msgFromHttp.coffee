module.exports = (robot) ->
  # robot.enter (msg) ->
  #   console.log('enter', msg)

  robot.router.post('/hubot/msgs', (req, res) ->
    console.log(req.body)
#    room = req.params.room
    msg = req.body.msg

    robot.messageRoom process.env.HUBOT_DEV_ROOM, "#{msg}"
#    robot.messageRoom room, "#{msg}"

    res.send 'OK'
  )
