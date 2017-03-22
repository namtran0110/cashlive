$(document).on 'turbolinks:load', ->
  $('#message-input').on 'keyup', (event) ->
    if event.keyCode == 13
      App.messages.createMessage body: $(this).val()
      $(this).val ''
    return
  $('.js-setup-store-chat').each ->
    storeId = $(this).data('store-id')
    window.setupStoreChat storeId
    return
  return
