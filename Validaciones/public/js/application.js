$(document).ready(function() {
//==============================================================================
//Ocultar las formas
//==============================================================================
  $('#frm_i').hide();
  $('#frm_r').hide();
  $('#btn_i').hide();

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
    var name = $("#name").val();
    var email = $("#email").val();
    var password = $("#pwd").val();
    var bo1 = isValidName(name)
    var bo2 = isValidEmail(email)
    var bo3 = isValidPassword(password)
    if (bo1 && bo2 && bo3) {
      alert("success")
    };
  
    // $.post('/user/reg',cadena,function(data)
    // {       
    //   $("#principal").html(data);
    // });
  });
//==============================================================================  
  $('body').on('click','#btn_ini',function(event) {
    event.preventDefault();
    var cadena = $(this).parent().parent().parent().serialize();
    var email = $("#email").val();
    var password = $("#pwd").val();
    var bo2 = isValidEmail(email)
    var bo3 = isValidPassword(password)
    if (bo2 && bo3) {
      alert("success")
    };
    // $.post('/user/ini',cadena,function(data)
    // {       
    //   $("#principal").html(data);
    // });
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
//============================================================================== 
  function isValidEmail(email) {
    var regex = /^[a-z0-9._-]+@[a-z0-9.-]+.[a-z]{2,4}$/;
    if (regex.test(email)){
      $("#email").next().hide();
      return true;
    }else{
      $("#email").next().show();
      return false;
    }; 
  }
  
//============================================================================== 
  function isValidName(name) {
    var regex = /^[a-zA-Z]+\s[a-zA-Z]+$/;
    if (regex.test(name)){
      $("#name").next().hide();
      return true;
    }else{
      $("#name").next().show();
      return false;
    }; 
  }
//============================================================================== 
  function isValidPassword(password) {
    var regex = /((?=.*d)(?=.*[a-z])(?=.*[A-Z]).{8,15})/;
    if (regex.test(password)){
      $("#pwd").next().hide();
      return true;
    }else{
      $("#pwd").next().show();
      return false;
    }; 
  }
//============================================================================== 


});
