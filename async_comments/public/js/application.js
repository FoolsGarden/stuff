$( document ).ready(function() {
  console.log( "ready!" );
  $('#area_frm_comment').hide();
  $('.error').hide();
//========================================================================
  $('#new_comment_button').click(function(event){
    $('#area_frm_comment').slideToggle();
    $('#comment_text').focus();
  });
//========================================================================
  $('#frm_comment').submit(function(event){
    event.preventDefault();
    var comment = $(this).find('textarea[name="comment_text"]').val();
    var author = $(this).find('input[name="comment_author"]').val();
    console.log("Comment:"+comment+" Author: "+author);
    if (comment!="" && author!="") {
      var cadena = $(this).serialize();
      console.log(cadena)
      save_coment($(this),cadena,comment,author); 
      
      $('.error').hide();  
    }else{
      if (comment=="" && author=="") {
        $('#error_a').show();
        $('#error_c').show();
      }else{
        if (comment=="") {
        $('#error_a').hide();
        $('#error_c').show();
        }else{
        $('#error_a').show();
        $('#error_c').hide();
        }
      }
    };
   });
//========================================================================  
  function make_coment ($form,comment,author) {
    $('#comment_list').append('<li>'+comment+'<span class="author">'+author+'</span></li>');
    $('#area_frm_comment').slideToggle();
    $form.find('textarea[name="comment_text"]').val("");
    $form.find('input[name="comment_author"]').val("");
    $('#new_comment_button').focus();
  }
//========================================================================
  function save_coment ($form,cadena,comment,author){
    $.post('/save/comment',cadena,function(data){
      if (data) {
        make_coment($(this),comment,author); 
        alert(data);  
      }else{
        alert("Error");
      };
    })
  };
//========================================================================  
//========================================================================
});