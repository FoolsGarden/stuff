$(document).ready(function () {
  $('.tab').eq(1).show();

  $('ul.tabs li').click(function () {
    if($(this).hasClass("inactive")){
      var number = $(this).index();
      $('.tab').hide().eq(number).show();
      $('ul.tabs li').removeClass('active').addClass('inactive');
      $(this).removeClass('inactive').addClass('active');
    }
  });
});
