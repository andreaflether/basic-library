document.addEventListener("turbolinks:load", function() {
  $(".alert").fadeTo(4000, 500).slideUp(500, function(){
      $(".alert").alert('close');
      $(this).remove();
  });

  $('.book').hover(function() {
    $(this).children('.book-info').fadeToggle().toggleClass('visible');
  });
});
