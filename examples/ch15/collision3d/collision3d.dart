#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class collision3d {

  collision3d() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var balls = [],
        numBalls = 20,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        top = -200,
        bottom = 200,
        left = -200,
        right = 200,
        back = 200,
        front = -200;
    
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball3d.withRadius(15);
      ball.xpos = Math.random() * 400 - 200;
      ball.ypos = Math.random() * 400 - 200;
      ball.zpos = Math.random() * 400 - 200;
      ball.vx = Math.random() * 5 - 1;
      ball.vy = Math.random() * 5 - 1;
      ball.vz = Math.random() * 5 - 1;
      balls.add(ball);
    }
    
    move (ball) {
      ball.xpos += ball.vx;
      ball.ypos += ball.vy;
      ball.zpos += ball.vz;
      
      if (ball.xpos + ball.radius > right) {
        ball.xpos = right - ball.radius;
        ball.vx *= -1;
      } else if (ball.xpos - ball.radius < left) {
        ball.xpos = left + ball.radius;
        ball.vx *= -1;
      }
      if (ball.ypos + ball.radius > bottom) {
        ball.ypos = bottom - ball.radius;
        ball.vy *= -1;
      } else if (ball.ypos - ball.radius < top) {
        ball.ypos = top + ball.radius;
        ball.vy *= -1;
      }
      if (ball.zpos + ball.radius > back) {
        ball.zpos = back - ball.radius;
        ball.vz *= -1;
      } else if (ball.zpos - ball.radius < front) {
        ball.zpos = front + ball.radius;
        ball.vz *= -1;
      }
      if (ball.zpos > -fl) {
        var scale = fl / (fl + ball.zpos);
        ball.scaleX = ball.scaleY = scale;
        ball.x = vpX + ball.xpos * scale;
        ball.y = vpY + ball.ypos * scale;
        ball.visible = true;
      } else {
        ball.visible = false;
      }
    }

    checkCollision (ballA, i) {
      for (var ballB, dx, dy, dz, dist, j = i + 1; j < numBalls; j++) {
        ballB = balls[j];
        dx = ballA.xpos - ballB.xpos;
        dy = ballA.ypos - ballB.ypos;
        dz = ballA.zpos - ballB.zpos;
        dist = Math.sqrt(dx * dx + dy * dy + dz * dz);
        if (dist < ballA.radius + ballB.radius) {
          ballA.color = "#0000ff";
          ballB.color = "#0000ff";
        }
      }
    }

    zSort (a, b) {
      return (b.zpos - a.zpos);
    }
    
    draw (ball) {
      if (ball.visible) {
        ball.draw(context);
      }
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      balls.forEach(move);
      var i=0;
      balls.forEach((var b) { checkCollision(b, i); i++; });
      balls.sort(zSort);
      balls.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new collision3d().run();
}
