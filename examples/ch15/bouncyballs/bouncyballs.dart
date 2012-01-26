#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class bouncyballs {

  bouncyballs() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var balls = [],
        numBalls = 150,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        gravity = 0.2,
        floor = 200,
        bounce = -0.6;
    
    for (var ball, i = 0; i < numBalls; i++) {
      String color = utilslib.Utils.parseColor( Math.random() * 0xffffff, false);
      ball = new Ball3d.withRadiusAndColor(3, color);
      ball.ypos = -100;
      ball.vx = Math.random() * 6 - 3;
      ball.vy = Math.random() * 6 - 3;
      ball.vz = Math.random() * 6 - 3;
      balls.add(ball);
    }
    
    move (ball) {
      ball.vy += gravity;
      ball.xpos += ball.vx;
      ball.ypos += ball.vy;
      ball.zpos += ball.vz;
      
      if (ball.ypos > floor) {
        ball.ypos = floor;
        ball.vy *= bounce;
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
  new bouncyballs().run();
}
