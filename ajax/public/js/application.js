$(document).ready(function() {
  $("#form1").submit(function(){
   var cadena = $(this).serialize();
   posting = $.post('/abuelita',cadena);
   return false;
   }); 
});
