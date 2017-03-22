window.setupStoreChat = (storeId) ->
  App.messages = App.cable.subscriptions.create {
    channel: 'MessagesChannel'
    store_id: storeId},
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log 'App.messages :: connected on store-id:', storeId

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log 'App.messages :: disconnected'

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log 'App.messages :: received', data
      $('.messages').append data.html

    createMessage: (data) ->
      @perform 'create_message', data
