//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap-sprockets


$(document).on('turbolinks:load', function(){
  $('.panel-toggle button').on('click', function(){
    $(this).closest($('.panel')).toggleClass('open closed');
  });
});
