$(document).on 'turbolinks:load', ->
  $('#message-input').on 'keyup', (event) ->
    if event.keyCode == 13
      if $(this).closest('.chat-input').hasClass('no-user')
        $('.messages').append('<div class="message alert alert-danger">You must log in to chat</div>')
      else
        App.messages.createMessage body: $(this).val()
        $(this).val ''
    return
  $('.js-setup-store-chat').each ->
    storeId = $(this).data('store-id')
    window.setupStoreChat storeId
    return
  return
