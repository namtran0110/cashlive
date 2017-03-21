App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'App.messages :: connected'

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log 'App.messages :: disconnected'

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log 'App.messages :: received', data
    $('.messages').append '<div class="message">' + data.message.body + "</div>"

  createMessage: (data) ->
    @perform 'create_message', data
