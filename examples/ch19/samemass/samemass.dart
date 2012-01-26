#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');
#source('../classes/point.dart');

class samemass {

  samemass() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var balls = [],
        numBalls = 15,
        bounce = -1.0,
        radius = 20;
    

    for (var ball, i = 0; i < numBalls; i++) {
      var color = utilslib.Utils.parseColor(Math.random() * 0xffffff, false);
      ball = new Ball.withRadiusAndColor(radius, color);
      ball.mass = radius;
      ball.x = Math.random() * canvas.width;
      ball.y = Math.random() * canvas.height;
      ball.vx = Math.random() * 10 - 5;
      ball.vy = Math.random() * 10 - 5;
      balls.add(ball);
    }
    
    checkWalls (ball) {
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
    }
    
    rotate (x, y, sin, cos, reverse) {
      return new point(
        (reverse) ? (x * cos + y * sin) : (x * cos - y * sin),
        (reverse) ? (y * cos - x * sin) : (y * cos + x * sin)
      );
    }
    
    checkCollision (ball0, ball1) {
      var dx = ball1.x - ball0.x,
          dy = ball1.y - ball0.y,
          dist = Math.sqrt(dx * dx + dy * dy);
      //collision handling code here
      if (dist < ball0.radius + ball1.radius) {
        //calculate angle, sine, and cosine
        var angle = Math.atan2(dy, dx),
            sin = Math.sin(angle),
            cos = Math.cos(angle),
            //rotate ball0's position
            pos0 = new point(0, 0), //point
            //rotate ball1's position
            pos1 = rotate(dx, dy, sin, cos, true),
            //rotate ball0's velocity
            vel0 = rotate(ball0.vx, ball0.vy, sin, cos, true),
            //rotate ball1's velocity
            vel1 = rotate(ball1.vx, ball1.vy, sin, cos, true);
        //collision reaction, swap the two velocities
        var temp = vel0;
        vel0 = vel1;
        vel1 = temp;
        //update position - to avoid objects becoming stuck together
        var absV = vel0.x.abs() + vel1.x.abs(),
            overlap = (ball0.radius + ball1.radius) - (pos0.x - pos1.x).abs();
        pos0.x += vel0.x / absV * overlap;
        pos1.x += vel1.x / absV * overlap;
        //rotate positions back
        var pos0F = rotate(pos0.x, pos0.y, sin, cos, false),
            pos1F = rotate(pos1.x, pos1.y, sin, cos, false);
        //adjust positions to actual screen positions
        ball1.x = ball0.x + pos1F.x;
        ball1.y = ball0.y + pos1F.y;
        ball0.x = ball0.x + pos0F.x;
        ball0.y = ball0.y + pos0F.y;
        //rotate velocities back
        var vel0F = rotate(vel0.x, vel0.y, sin, cos, false),
            vel1F = rotate(vel1.x, vel1.y, sin, cos, false);
        ball0.vx = vel0F.x;
        ball0.vy = vel0F.y;
        ball1.vx = vel1F.x;
        ball1.vy = vel1F.y;
      }
    }

    move (ball) {
      ball.x += ball.vx;
      ball.y += ball.vy;
      checkWalls(ball);
    }

    draw (ball) {
      ball.draw(context);
    }
    
    drawFrame(int t) {
      window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      balls.forEach(move);
      for (var ballA, i = 0, len = numBalls - 1; i < len; i++) {
        ballA = balls[i];
        for (var ballB, j = i + 1; j < numBalls; j++) {
          ballB = balls[j];
          checkCollision(ballA, ballB);
        }
      }
      balls.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new samemass().run();
}
