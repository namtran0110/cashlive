$(document).on 'turbolinks:load', ->

  # click setup broadcast button on load
  $('#setup-new-broadcast').click()

  # close button function
  $('#kill').on 'click', ->
    console.log 'end stream still needs configuration'
    return

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

  $('.js-setup-store-chat').each ->
    storeId = $(this).data('store-id')
    window.setupStoreChat storeId
    return
  return
