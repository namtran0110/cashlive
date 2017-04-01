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
      console.log currentItem
      return
  return
