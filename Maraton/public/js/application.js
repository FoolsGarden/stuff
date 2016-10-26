$(document).ready(function() {
//================================================
//Porcesos de inicio
//================================================
  $("#preguntas").hide();
  $("#btn_restart").hide();
  $("#decks").hide();
  $("#login").hide();
  $("#reg").hide();
  $("#user").hide();
//================================================
//Botones user
//================================================
  $("body").on("click","#btn_sign_out",function(event)
  {
    event.preventDefault();
    $.post('/sign/out',function(data)
    {       
      $("#preguntas").hide();
      //$("#btn_restart").hide();
      $("#decks").hide();
      $("#login").hide();
      $("#reg").hide();
      $("#user").hide();
      $("#first").show();
    });
  });
//================================================
//Botones funcionles
//================================================
  $("body").on("click","#btn_r",function(event)
  {
    event.preventDefault();
    $("#first").hide();
    $("#reg").slideDown();
  });
//================================================
  $("body").on("click","#btn_i",function(event)
  {
    event.preventDefault();
    $("#first").hide();
    $("#login").slideDown();
  });
  //================================================
  $("body").on("click","#btn_back",function(event)
  {
    event.preventDefault();
    $("#first").show();
    $("#login").hide();
    $("#reg").hide();
  });
//================================================  
  $("body").on("click","#btn_reg",function(event)
  {
    event.preventDefault();
    var cadena = $(this).parent().parent().serialize();
    $.post('/sign/up',cadena,function(data)
    {       
      if (data){
        $("#user").html(data);
        $("#reg").hide();
        $("#user").slideDown();
        $("#decks").slideDown();
      }
      else{
        alert('Some thing is wrong')
      }
    });
  });
//================================================
  $("body").on("click","#btn_ini",function(event)
  {
    event.preventDefault();
    var cadena = $(this).parent().parent().serialize();
    $.post('/sign/in',cadena,function(data)
    {       
      if (data){
        $("#user").html(data);
        $("#login").hide();
        $("#user").slideDown();
        $("#decks").slideDown();
      }
      else{
        alert('Some thing is wrong')
      }
    });
  });
//================================================
  $("body").on("click","#btn_restart",function(event)
  {
    event.preventDefault();
    $.post('/restart/game',function(data)
    {       
      $("#preguntas").html(data);
    });
  });
//================================================
  $("body").on("click","#btn_next",function(event)
  {
    event.preventDefault();
    $.post('/next/question',function(data)
    {       
      $("#preguntas").html(data);
    });
  });
//================================================
//DECKS
//================================================
  $("body").on("click","#btn_dk_1",function(event)
  {
    event.preventDefault();
    $("#preguntas").slideDown();
    var deck = $(this).attr('value');
    console.log(deck);
    $.post('/deck',deck,function(data)
    {       
       $("#preguntas").html(data);
       //$("#btn_restart").show();
    });
  });
//================================================  
  $("body").on("click","#btn_dk_2",function(event)
  {
    event.preventDefault();
    $("#preguntas").slideDown();
    var deck = $(this).attr('value');
    console.log(deck);
    $.post('/deck',deck,function(data)
    {       
       $("#preguntas").html(data);
       //$("#btn_restart").show();
    });
  });
//================================================
//Botones de respuesta
//================================================
  $("body").on("click","#btn_op1",function(event)
  {
    event.preventDefault();
    var $boton = $(this);
    var resp = $(this).attr('value');
    $("#btn_op1").prop( "disabled", true );
    $("#btn_op2").prop( "disabled", true );
    $("#btn_op3").prop( "disabled", true );

    $.post('/right/question',resp,function(data)
    {    
      if (data){
        $boton.css("background-color","green");
      }
      else{
        $boton.css("background-color","red");
      }
    });
  });
//================================================
  $("body").on("click","#btn_op2",function(event)
  {
    event.preventDefault();
    var $boton = $(this);
    var resp = $(this).attr('value');
    $("#btn_op1").prop( "disabled", true );
    $("#btn_op2").prop( "disabled", true );
    $("#btn_op3").prop( "disabled", true );

    $.post('/right/question',resp,function(data)
    {    
      console.log(data);
      if (data){
        $boton.css("background-color","green");
      }
      else{
        $boton.css("background-color","red");
      }

    });
  });
//================================================
  $("body").on("click","#btn_op3",function(event)
  {
    event.preventDefault();
    var $boton = $(this);
    var resp = $(this).attr('value');
    $("#btn_op1").prop( "disabled", true );
    $("#btn_op2").prop( "disabled", true );
    $("#btn_op3").prop( "disabled", true );

    $.post('/right/question',resp,function(data)
    {    
      console.log(data);
      if (data){
        $boton.css("background-color","green");
      }
      else{
        $boton.css("background-color","red");
      }

    });
  });
//================================================
});

  
  //  $("#a_tags").click(function()
  // {
  //   $("#m_posts").hide();
  //   $("#find_posts").hide();
  //   $("#all_tags").slideDown();
  //   $("#all_posts").hide();
  //   event.preventDefault();
  //   //var cadena = $(this).serialize();
  //   $.post('/all/tags',function(data)
  //   {       
  //     //console.log(data);
  //     $("#all_tags").html(data);
  //   });
    
  // });

  // $("#f_posts").click(function()
  // {
  //   $("#m_posts").hide();
  //   $("#all_posts").hide();
  //   $("#all_tags").hide();
  //   $("#find_posts").slideDown();

  // });
  // // $("body").on("submit","#form2",function(event)
  // // {
  // //   event.preventDefault();
  // //   //var cadena = $(this).serialize();
  // //   $.post('/all/posts',function(data)
  // //   {       
  // //     //console.log(data);
  // //     $("#all_posts").html(data);
  // //   });
  // // });
  // //Busca un post por id y lo despliega
  // $("body").on("submit","#form5",function(event)
  // {
  //   event.preventDefault();
  //   var cadena = $(this).serialize();
  //   $.post('/find/post',cadena,function(data)
  //   {       
  //     $("#find_post_model").html(data);
  //   });
  // });

  // $("body").on("submit","#form1",function(event)
  // {
  //   event.preventDefault();
  //   var cadena = $(this).serialize();
  //   $.post('/make/post',cadena,function(data)
  //   {       
  //     if (data) 
  //     {
  //       alert("Tu post fue creado con exito!");
  //       $("#form1").html(data);
  //     }
  //     else
  //     {
  //       alert("Error");
  //     }
  //   });
  // });
  // $("body").on("click","#confirm_edit_post_btn",function(event)
  // {
  //   event.preventDefault();
  //   var cadena = $(this).parent().serialize();
  //   console.log(cadena);
  //   $.post('/post/edit/confirm',cadena,function(data)
  //   {       
  //     $("#all_posts").html( data );
  //   });
  // });

  // $("body").on("click",".display_tags",function(event)
  // {
  //   event.preventDefault();
  //   //var cadena = $(this).val('id');
  //   var id = $(this).attr('name');
 
  //   $.post('/tag/find/post',id,function(data)
  //   {       
  //     $("#posts_in_model").html( data );
  //   });
  // });
  // $("body").on("click","#edit_post_btn",function(event)
  // {
  //   event.preventDefault();
  //   //var cadena = $(this).val('id');
  //   var id = $(this).attr('name');
 
  //   $.post('/post/edit',id,function(data)
  //   {       
  //     $("#edit_post_modle").html( data );
  //   });
  // });
  // $("body").on("click","#delete_post_btn",function(event)
  // {
  //   event.preventDefault();
  //   //var cadena = $(this).val('id');
  //   var id = $(this).attr('name');
 
  //   $.post('/post/delete',id,function(data)
  //   {       
  //     $("#all_posts").html( data );
  //   });
  // });

//});
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