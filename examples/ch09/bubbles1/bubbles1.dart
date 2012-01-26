#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class bubbles1 {

  bubbles1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var centerBall = new Ball.withRadiusAndColor(100, "#cccccc");
    List<Ball> balls = new List<Ball>();
    var numBalls = 10,
        spring = 0.03,
        bounce = -1;
    
    centerBall.x = canvas.width / 2;
    centerBall.y = canvas.height / 2;
    
    for (var i = 0; i < numBalls; i++) {
      String color = utilslib.Utils.parseColor(Math.random() * 0xffffff, false);
      var ball = new Ball.withRadiusAndColor(Math.random() * 40 + 5, color);
      ball.x = Math.random() * canvas.width / 2;
      ball.y = Math.random() * canvas.height / 2;
      ball.vx = Math.random() * 6 - 3;
      ball.vy = Math.random() * 6 - 3;
      balls.add(ball);
    }
    
    move(var ball) {
      ball.x += ball.vx;
      ball.y += ball.vy;
      if (ball.x + ball.radius > canvas.width) {
        ball.x = canvas.width - ball.radius;
        ball.vx *= bounce;
      } else if (ball.x - ball.radius < 0) {
        ball.x = ball.radius;
        ball.vx *= bounce;
      }
      if (ball.y + ball.radius > canvas.height) {
        ball.y = canvas.height - ball.radius;
        ball.vy *= bounce;
      } else if (ball.y - ball.radius < 0) {
        ball.y = ball.radius;
        ball.vy *= bounce;
      }
    };
    
    draw(var ball) {
      var dx = ball.x - centerBall.x,
      dy = ball.y - centerBall.y,
      dist = Math.sqrt(dx * dx + dy * dy),
      min_dist = ball.radius + centerBall.radius;

      if (dist < min_dist) {
        var angle = Math.atan2(dy, dx),
            tx = centerBall.x + Math.cos(angle) * min_dist,
            ty = centerBall.y + Math.sin(angle) * min_dist;
        ball.vx += (tx - ball.x) * spring;
        ball.vy += (ty - ball.y) * spring;
      }
      ball.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      balls.forEach(move);
      balls.forEach(draw);
      centerBall.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new bubbles1().run();
}
