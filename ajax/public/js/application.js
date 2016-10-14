$(document).ready(function() 
{ 
  $("#form1").submit(function()
  {
    event.preventDefault();
    var cadena = $(this).serialize();
    $.post('/abuelita',cadena,function(resp)
    {
       $("#resp").html(resp);
       
    });
    $("#text_in").val("");
    //$('#grandma_says').append(x)
  }); 

  // $.post

});
