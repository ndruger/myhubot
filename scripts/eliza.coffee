

ElizaBot = require('elizabot')

eliza = new ElizaBot()
initial = eliza.getInitial()

module.exports = (robot) ->
  robot.hear /(.*)/i, (msg) ->
    t = msg.match[0]
    res = eliza.transform(t)
    msg.send(res)
