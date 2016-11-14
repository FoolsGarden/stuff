$( document ).ready(function() {
  var actual = 1;
  var img = $('.frames li');
//==========================================================  
  $('#next_frame').click(function(){
    event.preventDefault();
    next();  
  });
  //==========================================================  
  $('#previous_frame').click(function(){
    event.preventDefault();
    previous();   
  });
//==========================================================  
  function next () {
    img.eq(actual).hide();
    increases();
    img.eq(actual).show();
  }

//==========================================================  
  function previous (argument) {
    img.eq(actual).hide();
    decrement();
    img.eq(actual).show();
  }
//==========================================================  
  function increases () {
    if (actual < img.length-1) {
      actual = actual + 1;
    }else{
      actual = 0;
    };
  }
//==========================================================
  function decrement () {
    if (actual > 0) {
      actual = actual - 1;
    }else{
      actual = img.length-1;
    };
  };
//==========================================================  
  function order (center) {
    switch (center) {
    case 0:
        img.eq(2).offset({left:0});
        img.eq(0).offset({left:650});
        img.eq(1).offset({left:1300});
        break;
    case 1:
        img.eq(0).offset({left:0});
        img.eq(1).offset({left:650});
        img.eq(2).offset({left:1300});
        break;
    case 2:
        img.eq(1).offset({left:0});
        img.eq(2).offset({left:650});
        img.eq(0).offset({left:1300});
    }
  };
//==========================================================  
});