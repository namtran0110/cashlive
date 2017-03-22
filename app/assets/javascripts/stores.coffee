$(document).on 'turbolinks:load', ->

  $('#message-input').on 'keyup', (event) ->
    if event.keyCode == 13
      if $(this).closest('.chat-input').hasClass('no-user')
        $('.messages').append('<div class="message alert alert-danger">You must log in to chat</div>')
        $(this).val ''
      else
        App.messages.createMessage body: $(this).val()
        $(this).val ''
    return

  $('#message-send').on 'click', (event) ->
    event.preventDefault()
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
