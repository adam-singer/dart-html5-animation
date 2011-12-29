#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class fountain {

  fountain() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<Ball> balls = new List<Ball>();
    var numBalls = 80;
    var gravity = 0.5;
    
    for (var i=0; i<numBalls; i++) {
      String color = utilslib.Utils.parseColor(Math.random() * 0xffffff, false);
      var ball = new Ball.withRadiusAndColor(2, color); 
      ball.x  = canvas.width / 2;
      ball.y  = canvas.height;
      ball.vx = Math.random() * 2 - 1;
      ball.vy = Math.random() * -10 - 10;
      balls.add(ball);
    }
    
    draw (var ball) {
      ball.vy += gravity;
      ball.x += ball.vx;
      ball.y += ball.vy;
      if (ball.x - ball.radius > canvas.width ||
          ball.x + ball.radius < 0 ||
          ball.y - ball.radius > canvas.height ||
          ball.y + ball.radius < 0) {
        ball.x = canvas.width / 2;
        ball.y = canvas.height;
        ball.vx = Math.random() * 2 - 1;
        ball.vy = Math.random() * -10 - 10;
      }
      ball.draw(context);
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      balls.forEach(draw);
    };
    drawFrame(0);
  }
}

void main() {
  new fountain().run();
}
