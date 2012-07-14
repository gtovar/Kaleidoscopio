# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(window).scroll ->
   if $(window).scrollTop() > $(document).height() - $(window).height() - 50
    $('.pagination').text("Fetching more courses...")
    $.getScript($('.pagination .next_page a').attr('href'));
