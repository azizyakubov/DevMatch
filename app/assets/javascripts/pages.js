// Fade out flash messages after a few seconds delay
$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(4000);
});
