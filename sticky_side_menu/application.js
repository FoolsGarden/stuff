$(document).ready(function() {
  var open = true;
  
  $('body').on('click','div#btn',function(event){
    event.preventDefault();
    if (open) {
      $('.nav').animate({left: "-130px"});
      $('.container').animate({marginLeft:"20px"}) 
      open=false;
    }else{
      $('.nav').animate({left: "0px"}); 
      $('.container').animate({marginLeft:"150px"}) 
      open = true;
    }
  });

});