$( document ).ready(function() {
    $(this).find('input[name="selector"]').focus();
    $('#style_editor').submit(function(event){
      event.preventDefault(); 
      var selector = $(this).find('input[name="selector"]').val();
      var property = $(this).find('input[name="property"]').val();
      var value = $(this).find('input[name="value"]').val();
      console.log("Selector: "+selector+" Property: "+property+" Value: "+value);
      $(selector).css(property,value);
      $(this).find('input[name="selector"]').val("");
      $(this).find('input[name="property"]').val("");
      $(this).find('input[name="value"]').val("");
      $(this).find('input[name="selector"]').focus();
    });
});
