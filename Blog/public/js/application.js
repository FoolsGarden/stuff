$(document).ready(function() {
  //Esconder las formas
  $("#m_posts").hide();
  $("#all_posts").hide();
  $("#find_posts").hide();
  $("#all_tags").hide();

  $("#n_Post").click(function()
  {
    $("#all_posts").hide();
    $("#find_posts").hide();
    $("#all_tags").hide();
    $("#m_posts").show();
  });
  $("#a_posts").click(function()
  {
    $("#m_posts").hide();
    $("#find_posts").hide();
    $("#all_tags").hide();
    $("#all_posts").show();
    event.preventDefault();
    //var cadena = $(this).serialize();
    $.post('/all/posts',function(data)
    {       
      //console.log(data);
      $("#all_posts").html(data);
    });

  });
  $("#a_tags").click(function()
  {
    $("#m_posts").hide();
    $("#find_posts").hide();
    $("#all_tags").show();
    $("#all_posts").hide();
    event.preventDefault();
    //var cadena = $(this).serialize();
    $.post('/all/tags',function(data)
    {       
      //console.log(data);
      $("#all_tags").html(data);
    });
    
  });

  $("#f_posts").click(function()
  {
    $("#m_posts").hide();
    $("#all_posts").hide();
    $("#all_tags").hide();
    $("#find_posts").show();

  });
  // $("body").on("submit","#form2",function(event)
  // {
  //   event.preventDefault();
  //   //var cadena = $(this).serialize();
  //   $.post('/all/posts',function(data)
  //   {       
  //     //console.log(data);
  //     $("#all_posts").html(data);
  //   });
  // });
  //Busca un post por id y lo despliega
  $("body").on("submit","#form5",function(event)
  {
    event.preventDefault();
    var cadena = $(this).serialize();
    $.post('/find/post',cadena,function(data)
    {       
      //console.log(data);
      $("#find_posts").html('<form id="form5" action = "/find/post" method="post">'+ data + '</form>');
    });
  });

  $("body").on("submit","#form1",function(event)
  {
    event.preventDefault();
    var cadena = $(this).serialize();
    $.post('/make/post',cadena,function(data)
    {       
      console.log(data);
      if (data=="true") 
      {
        alert("Error");
      }
      else
      {
        alert("El post fue creado");
      }

       
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