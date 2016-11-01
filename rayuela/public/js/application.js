$(document).ready(function() {
  var play1 = true;
  var play2 = true;
  var count1 = 0;
  var count2 = 0;
  var finish = false;
  var playTime = 100;
  var round = 1;
  var one = "";
  var two = "";
  var winner = "0";

  $('#game').hide();
//====================================================================================================
//Creación de los jugadores
//====================================================================================================
  $('#btn_jugar').click(function(event){
    event.preventDefault();
    one = $('#player1_name').val();
    two = $('#player2_name').val();
    if (one != "" && two !=""){
    var cadena = $(this).parent().serialize();
    $.post('/user',cadena ,function(data)
     {       
      $('#game').html(data);  
      create();
      $('#Users').hide();
      $('#game').slideDown();
     });
    }else
    {
      alert("Son necesarios dos jugadores");
    }
});
//====================================================================================================
//On click in 'Start'
//====================================================================================================
  $('#game').on('click','#start_btn',function(event){
    event.preventDefault();
    if (finish){
      $.post('/next/game',winner ,function(data)
     {       
      $('#game').html(data);  
      create();
      restart();
      $('#ronda').html("<h2>Round: "+round+"</h2>")
      playGame(3);
     });
    }
    else
    { 
      $('#ronda').html("<h2>Round: "+round+"</h2>")     
      playGame(3);
    }
  });
//====================================================================================================
//Contador
//====================================================================================================
  function playGame(time) {
      setTimeout(function(){
        if (time > 0)
        {
          $('#cuenta').html("<h2>"+time+"</h2>");
          time = time - 1;
          playGame(time);
        }else
        {
          $('#cuenta').html("<h2>GO!</h2>");
          $('#start_btn').html("Restart");
          startGame();
        }

      },1000); 
    }; 
//====================================================================================================
//Para que sea una funión recursiva
//====================================================================================================
  function startGame(){
    var id_P1 = $('#Player1 .active');
    var id_P2 = $('#Player2 .active');
    move(id_P1,id_P2);
  };
//====================================================================================================
//Desplazamiento 
//====================================================================================================
  function move(id_P1,id_P2) {
      setTimeout(function(){
        if(play1 && count1 < 100)
        {
          count1 = count1 + 1;
          id_P1.removeClass('active');
          id_P1.next().addClass('active');
        }
        if(play2 && count2 < 100)
        {
          count2 = count2 + 1;
          id_P2.removeClass('active');
          id_P2.next().addClass('active');
        }
        if(!play1 && !play2 || count1>=100 || count2>=100){
          finshGame();
        }
        if(play1 || play2 ){
          startGame();
        }
      },playTime); 
    }; 
    //====================================================================================================
//Cuando el juego se reinicia
//====================================================================================================
  function restart(){
    $('#cuenta').html('')
    $("#resultado").html('');
    playTime = playTime - 20;
    round = round + 1;
    play1 = true;
    play2 = true;
    count1 = 0;
    count2 = 0;
    finish = false;
    winner = 0;
    create();
  };
//====================================================================================================
//Escucha las teclas de control
//====================================================================================================
  $(document).keydown(function(event){
      if(event.which == 65)
      {
        play1 = false;
        console.log(count1);
      }
      if(event.which == 76)
        {
          play2 = false;
          console.log(count2);
        }
  });
  //====================================================================================================
//Función creadora del juego
//====================================================================================================
  function create(){
    $("#Player1").html('<td id="player1"><strong>'+one+'</strong></td>');
    $("#Player2").html('<td id="player2"><strong>'+two+'</strong></td>');

    $("#Player1").append('<td class="active"></td>');
    $("#Player2").append('<td class="active"></td>');
    
    for ( var i = 0; i < 90; i++ ) {
      $("#Player1").append('<td></td>');
      $("#Player2").append('<td></td>');
    }

    $("#Player1").append('<td id="final_line"></td>');
    $("#Player2").append('<td id="final_line"></td>');
    
    for ( var i = 0; i < 9; i++ ) {
      $("#Player1").append('<td></td>');
      $("#Player2").append('<td></td>');
    }
  };
//====================================================================================================
//Función que finaliza el juego y decide un ganador
//====================================================================================================
  function finshGame(){
    finish=true;
    if (count1>90 || count2>90)
    {
      if(count1==count2)
      {
        $("#resultado").html('<h2>Perdieron los dos</h2>');
      }else
      {
        if(count1<91){
          $("#resultado").html('<h2>Gana'+ one +'</h2>');
                  winner = "1"
          $("#Player1 td").not('.active').not('#final_line').css("background-color", "green");
        }else
        { 
          if(count2<91)
          {
            $("#resultado").html('<h2>Gana '+ two +'</h2>');
            winner = "2"
            $("#Player2 td").not('.active').not('#final_line').css("background-color", "green");
          }else
          {
            $("#resultado").html('<h2>Perdieron los dos</h2>');
          }
        }
      }
    }else
    {
      if(count1==count2)
      {
        $("#resultado").html('<h2>Empate</h2>');
      }else
      {
        if(count1<count2){
          $("#resultado").html('<h2>Gana '+ two +'</h2>');
           winner = "2"
          $("#Player2 td").not('.active').not('#final_line').css("background-color", "green");;
        }else
        {
          $("#resultado").html('<h2>Gana '+ one +'</h2>');
           winner = "1"
          $("#Player1 td").not('.active').not('#final_line').css("background-color", "green");
        }
      }
    }
  };  

});
