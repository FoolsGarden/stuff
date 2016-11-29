$(document).ready(function() {
  

  
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
/