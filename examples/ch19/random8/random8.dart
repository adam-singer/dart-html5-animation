#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class random8 {

  random8() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 300,
    ball0 = new Ball(),
    ball1 = new Ball.withRadius(80);
    
    ball0.x = 100;
    ball0.y = canvas.height / 2;
    ball1.x = 300;
    ball1.y = canvas.height / 2;

    detectCollision (x, y, ball) {
      var dx = x - ball.x,
          dy = y - ball.y,
          dist = Math.sqrt(dx * dx + dy * dy);
      return (dist < ball.radius); //true or false
    }
    
    while (numDots--) {
      //initialize variables
      var x = 0,
          y = 0;
      
      //if not in ballA AND not in ballB, set new random position
      while (!detectCollision(x, y, ball0) && !detectCollision(x, y, ball1)) {
        //get random position on canvas
        x = Math.random() * canvas.width;
        y = Math.random() * canvas.height;
      }

      context.fillStyle = "#000000";
      context.beginPath();
      //x, y, radius, start_angle, end_angle, anti-clockwise
      context.arc(x, y, 2, 0, (Math.PI * 2), true);
      context.closePath();
      context.fill();
    }
  }
}

void main() {
  new random8().run();
}
