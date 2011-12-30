#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class bubbles3 {

  bubbles3() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<Ball> balls = new List<Ball>();
    var numBalls = 10,
        bounce = -0.5,
        spring = 0.015,
        gravity = 0.1;
    
    for (var ball, i = 0; i < numBalls; i++) {
      String color = utilslib.Utils.parseColor(Math.random() * 0xffffff, false);
      ball = new Ball.withRadiusAndColor(Math.random() * 30 + 20, color);
      ball.x = Math.random() * canvas.width / 2;
      ball.y = Math.random() * canvas.height / 2;
      ball.vx = Math.random() * 6 - 3;
      ball.vy = Math.random() * 6 - 3;
      balls.add(ball);
    }
    
    checkCollision(var ballA, var i) {
      for (var ballB, dx, dy, dist, min_dist, j = i + 1; j < numBalls; j++) {
        ballB = balls[j];
        dx = ballB.x - ballA.x;
        dy = ballB.y - ballA.y;
        dist = Math.sqrt(dx * dx + dy * dy);
        min_dist = ballA.radius + ballB.radius;

        if (dist < min_dist) {
          var tx = ballA.x + dx / dist * min_dist,
              ty = ballA.y + dy / dist * min_dist,
              ax = (tx - ballB.x) * spring,
              ay = (ty - ballB.y) * spring;
          ballA.vx -= ax;
          ballA.vy -= ay;
          ballB.vx += ax;
          ballB.vy += ay;
        }
      }
    };
    
    move(var ball) {
      ball.vy += gravity;
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
      ball.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var i=0;
      balls.forEach((var b) {
        checkCollision(b,i); i++;
      });
      balls.forEach(move);
      balls.forEach(draw);
    };
    
    drawFrame(0);
  }
}

void main() {
  new bubbles3().run();
}
