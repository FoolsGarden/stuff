$(document).ready(function() {
  //Esconder las formas
  $("#m_posts").show();
  $("#all_posts").hide();
  $("#find_posts").hide();
  $("#all_tags").hide();
  $("#id").hide();

  $("#n_Post").click(function()
  {
    $("#all_posts").hide();
    $("#find_posts").hide();
    $("#all_tags").hide();
    $("#m_posts").slideDown();
  });
  $("#a_posts").click(function()
  {
    $("#m_posts").hide();
    $("#find_posts").hide();
    $("#all_tags").hide();
    $("#all_posts").slideDown();
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
    $("#all_tags").slideDown();
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
    $("#find_posts").slideDown();

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
      $("#find_post_model").html(data);
    });
  });

  $("body").on("submit","#form1",function(event)
  {
    event.preventDefault();
    var cadena = $(this).serialize();
    $.post('/make/post',cadena,function(data)
    {       
      if (data) 
      {
        alert("Tu post fue creado con exito!");
        $("#form1").html(data);
      }
      else
      {
        alert("Error");
      }
    });
  });
  $("body").on("click","#confirm_edit_post_btn",function(event)
  {
    event.preventDefault();
    var cadena = $(this).parent().serialize();
    console.log(cadena);
    $.post('/post/edit/confirm',cadena,function(data)
    {       
      $("#all_posts").html( data );
    });
  });

  $("body").on("click",".display_tags",function(event)
  {
    event.preventDefault();
    //var cadena = $(this).val('id');
    var id = $(this).attr('name');
 
    $.post('/tag/find/post',id,function(data)
    {       
      $("#posts_in_model").html( data );
    });
  });
  $("body").on("click","#edit_post_btn",function(event)
  {
    event.preventDefault();
    //var cadena = $(this).val('id');
    var id = $(this).attr('name');
 
    $.post('/post/edit',id,function(data)
    {       
      $("#edit_post_modle").html( data );
    });
  });
  $("body").on("click","#delete_post_btn",function(event)
  {
    event.preventDefault();
    //var cadena = $(this).val('id');
    var id = $(this).attr('name');
 
    $.post('/post/delete',id,function(data)
    {       
      $("#all_posts").html( data );
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