qs = require('querystring')
twilio = require('twilio')
client = twilio(process.env.TWILIO_ACCOUNT_SID, process.env.TWILIO_AUTH_TOKEN)
_ = require('lodash')

call = (text) ->
  console.log(text)
  twiml = '<Response><Say voice="woman" language="ja-jp">' + _.escape(text) + '</Say></Response>'

  client.makeCall({
    to: process.env.TWILIO_TO,
    from: process.env.TWILIO_FROM,
    url: 'http://twimlets.com/echo?Twiml=' + qs.escape(twiml)
  }, (err, responseData) ->
    throw err if err
    console.log(responseData.from)
  )

module.exports = (robot) ->
  robot.respond /call (.*)/i, (msg) ->
    call(msg.match[1])
