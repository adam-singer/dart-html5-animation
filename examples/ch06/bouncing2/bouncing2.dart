#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class bouncing2 {

  bouncing2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vx = Math.random() * 10 - 5,
        vy = Math.random() * 10 - 5;
    var bounce = -0.7;
    var gravity = 0.1;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var left = 0,
          right = canvas.width,
          top = 0,
          bottom = canvas.height;

      vy += gravity;
      ball.x += vx;
      ball.y += vy;

      if (ball.x + ball.radius > right) {
        ball.x = right - ball.radius;
        vx *= bounce;
      } else if (ball.x - ball.radius < left) {
        ball.x = left + ball.radius;
        vx *= bounce;
      }
      if (ball.y + ball.radius > bottom) {
        ball.y = bottom - ball.radius;
        vy *= bounce;
      } else if (ball.y - ball.radius < top) {
        ball.y = top + ball.radius;
        vy *= bounce;
      }
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new bouncing2().run();
}
