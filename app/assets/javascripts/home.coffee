$(document).on 'turbolinks:load', ->
  coverflow = $('#coverflow').flipster
    itemContainer: 'ul'
    itemSelector: 'li'
    start: 'center'
    fadeIn: 400
    loop: true
    spacing: -0.5
    click: true
    keyboard: true
    scrollwheel: false
    touch: true
    nav: false
    buttons: false
    buttonPrev: 'Previous'
    buttonNext: 'Next'
    onItemSwitch: (currentItem, previousItem) ->
      updatePanelText(currentItem)
      return

    updatePanelText = (currentItem) ->
      storeName = currentItem.dataset.store
      streamName = currentItem.dataset.stream
      $('#coverflow-panel').html "<p>Live Store: <strong>" + storeName + "</strong><br>Streaming: \"" + streamName + "\"</p>"
      return

  #set initial panel markup, after flipster is initialized
  initialItem = $('.flipster__item--current')
  storeName = initialItem.data("store")
  streamName = initialItem.data("stream")
  $('#coverflow-panel').html "<p>Live Store: <strong>" + storeName + "</strong><br>Streaming: \"" + streamName + "\"</p>"

  return
