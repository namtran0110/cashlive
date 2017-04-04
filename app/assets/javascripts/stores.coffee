$(document).on 'turbolinks:load', ->

  # trigger end store-actions
  $('#stop-recording').on 'click', (event) ->
    $('#end-stream-submit').click()
    App.messages.endStream bool: true
    return

  # click setup broadcast button on load
  $('#setup-new-broadcast').click()

  #send message on pressing enter
  $('#message-input').on 'keyup', (event) ->
    if event.keyCode == 13
      if $(this).closest('.chat-input').hasClass('no-user')
        $('.messages').append('<div class="message alert alert-danger">You must log in to chat</div>')
        $(this).val ''
      else
        bodytext = $(this).val().replace(/\r?\n|\r/g, "")
        App.messages.createMessage body: bodytext
        $(this).val ''
    return

  #send message on clicking send button
  $('#message-send').on 'click', (event) ->
    if $(this).closest('.chat-input').hasClass('no-user')
      $('.messages').append('<div class="message alert alert-danger">You must log in to chat</div>')
      $(this).prev('#message-input').focus().val ''
    else
      App.messages.createMessage body: $(this).prev('#message-input').val()
      $(this).prev('#message-input').focus().val ''
    return

  #setup store chat
  $('.js-setup-store-chat').each ->
    storeId = $(this).data('store-id')
    window.setupStoreChat storeId
    return
  return
