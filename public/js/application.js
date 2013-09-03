var position1 = 2;
var position2 = 2; 
var gameover = false;

$(document).ready(function() {
  var st = new Date().getTime() / 1000;
  
  $(document).on('keyup', function(event) {
    if (gameover == false) {
      if(event.keyCode == 80) {
        position1++;
        $('#player1_strip').find('td:nth-child('+(position1-1)+')').removeClass('active');
        $('#player1_strip').find('td:nth-child('+position1+')').addClass('active');
      }
      else if(event.keyCode == 81) {
        position2++;
        $('#player2_strip').find('td:nth-child('+(position2-1)+')').removeClass('active');
        $('#player2_strip').find('td:nth-child('+position2+')').addClass('active');
      }
      if(position1 >= 13){
        alert("PLAYER 1 WINS!");
        var winner = 1;
        gameover = true;
      }
      else if (position2 >= 13) {
        
        var winner = 2;
        gameover = true;
      }
    }
    if (gameover == true) {
      var en = new Date().getTime() / 1000;
      var dur = en - st
      alert("PLAYER " + winner + " WINS in " + dur + "seconds!");
      $.post('/endgame', {winner_time: dur, winner_id: winner }, function(response){
        console.log(response);
      });
      return true
    }
  })
});
