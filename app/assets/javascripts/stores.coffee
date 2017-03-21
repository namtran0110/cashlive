$(document).on 'turbolinks:load', ->
  $('#message-input').on 'keyup', (event) ->
    if event.keyCode == 13
      App.messages.createMessage body: $(this).val()
      console.log 'submitting...'
      $(this).val ''
    return
  return
