var express = require('express')
var app = express()
var bodyParser = require('body-parser')
const axios = require('axios')

app.use(bodyParser.json())

app.use( bodyParser.urlencoded( {extended: true} ) )

app.post('/new-message', function(req, res) {
  const { message } = req.body

  //Each message contains "text" and a "chat" object, which has an "id" which is the chat id

  if (false || !message || message.text.toLowerCase().indexOf('marco') < 0) {
    return res.end()
  }

  axios
    .post(
      'https://api.telegram.org/601767759:AAHJai0roCDAq1deXGpKRDJq3Jy0OOIVOfw/sendMessage',
      {
        chat_id: message.chat.id,
        text: 'Ciao!!'
      }
    )
    .then(response => {
      console.log('Message posted')
      res.end('ok')
    })
    .catch(err => {
      console.log('Error :', err)
      res.end('Error :' + err)
    })
})

// Finally, start our server
app.listen(3000, function() {
  console.log('Telegram app listening on port 3000!')
})
