#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class zsort {

  zsort() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var balls = [],
        numBalls = 50,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        top = -100,
        bottom = 100,
        left = -100,
        right = 100,
        back = 100,
        front = -100;
    
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball3d.withRadius(15);
      ball.vx = Math.random() * 10 - 5;
      ball.vy = Math.random() * 10 - 5;
      ball.vz = Math.random() * 10 - 5;
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
      balls.sort(zSort);
      balls.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new zsort().run();
}
