module.exports = (robot) ->
  # robot.enter (msg) ->
  #   console.log('enter', msg)

  robot.router.post('/hubot/travis', (req, res) ->
    console.log(req.body)
    payload = JSON.parse req.body.payload

    robot.messageRoom process.env.HUBOT_DEV_ROOM, """
    #{payload.status_message} (#{payload.build_url}) on #{payload.repository.name}:#{payload.branch}
    """
#    robot.messageRoom room, "#{msg}"

    res.send 'OK'
  )
