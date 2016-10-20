$(document).ready(function() {
  //Esconder las formas
  $("#m_posts").hide();
  $("#all_posts").hide();

  $("#n_Post").click(function()
  {
    $("#all_posts").hide();
    $("#m_posts").show();
  });
  $("#a_posts").click(function()
  {
    $("#m_posts").hide();
    $("#all_posts").show();
  });
  $("#form2").submit(function(event)
  {
    event.preventDefault();
    //var cadena = $(this).serialize();
    $.post('/all/posts',function(data)
    {       
      //console.log(data);
      $("#all_posts").html(data);
    });
  });

});
//Para los click
// $( "#tag1" ).click(function() {
//     $(this).val("");
//     $(this).css('color', 'black');
// });
//   $( "#tag2" ).click(function() {
//     $("#tag2").val("");
//     $(this).css('color', 'black');
// });
//   $( "#tag3" ).click(function() {
//     $("#tag3").val("");
//     $(this).css('color', 'black');
// });
//   $( "#tag4" ).click(function() {
//     $("#tag4").val("");
//     $(this).css('color', 'black');
// });
//   $( "#tag5" ).click(function() {
//     $("#tag5").val("");
//     $(this).css('color', 'black');
// });
//     $( "#post" ).click(function() {
//     $("#post").val("");
//     $(this).css('color', 'black');
// });
//     $( "#title" ).click(function() {
//     $("#title").val("");
//     $(this).css('color', 'black');
// });