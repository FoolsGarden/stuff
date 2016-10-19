$(document).ready(function() {

  $("#form1").submit(function(event)
  {
     event.preventDefault();
     //var cadena = $(this).serialize();
     $.post('/rolls',function(data)
     {       
          console.log(data);
          $("#die").html(data);
            
     });
  //   $("#text_in").val("");
    //$('#grandma_says').append(x)
  
  });
// $(document).ready(function() 
// { 
//   $("#form1").submit(function()
//   {
//     event.preventDefault();
//     var cadena = $(this).serialize();
//     $.post('/abuelita',cadena,function(resp)
//     {
//        $("#resp").html("Tu Abuelita dice: "+resp);
       
//     });
//     $("#text_in").val("");
//     //$('#grandma_says').append(x)
//   }); 

//   // $.post

});