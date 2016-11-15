$(document).ready(function() {
//==============================================================================
//Ocultar las formas
//==============================================================================
  $('#frm_i').hide();
  $('#frm_r').hide();
//==============================================================================
//Botones
//==============================================================================
  $('#btn_r').click(function(event) {
    event.preventDefault();
    $('#frm_i').hide();
    $('#frm_r').toggle();
  });
//==============================================================================
  $('#btn_i').click(function(event) {
    event.preventDefault();
    $('#frm_r').hide();
    $('#frm_i').toggle();
  });
//==============================================================================
  $('body').on('click','#btn_reg',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    $.post('/user/reg',cadena,function(data)
    {       
      $("#principal").html(data);
    });
  });
//==============================================================================  
  $('body').on('click','#btn_ini',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    $.post('/user/ini',cadena,function(data)
    {       
      $("#principal").html(data);
    });
  });
//============================================================================== 
  $('body').on('click','#btn_mod',function(event) {
    event.preventDefault();
    var cadena = $('#frm_mod').serialize();
    $.post('/user/mod',cadena,function(data)
    {       
      $("#principal").html(data);
    });
  });
});
