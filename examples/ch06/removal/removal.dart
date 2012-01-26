#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class removal {

  removal() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var log = document.query('#log');
    List<Ball> balls = new List<Ball>();
    var numBalls = 10;
        
    for (var i=0; i<numBalls; i++) {
      var ball = new Ball.withRadius(20);
      ball.id = "ball${i}";
      ball.x  = Math.random() * canvas.width;
      ball.y  = Math.random() * canvas.height;
      ball.vx = Math.random() * 2 - 1;
      ball.vy = Math.random() * 2 - 1;
      balls.add(ball);
    }
    
    draw(var ball, var pos) {
      ball.x += ball.vx;
      ball.y += ball.vy;
      if (ball.x - ball.radius > canvas.width ||
          ball.x + ball.radius < 0 ||
          ball.y - ball.radius > canvas.height ||
          ball.y + ball.radius < 0) {
        balls.removeRange(pos, 1); //remove ball from array
        if (balls.length > 0) {
          log.value = "Removed " + ball.id;
        } else {
          log.value = "All gone!";
        }
      }
      ball.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var i = balls.length;
      while (i--) {
        draw(balls[i], i);
      }
    };
    
    drawFrame(0);
  }
}

void main() {
  new removal().run();
}
