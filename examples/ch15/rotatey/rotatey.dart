#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class rotatey {

  rotatey() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var balls = [],
        numBalls = 50,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleY=0;
    
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball3d.withRadius(15);
      ball.xpos = Math.random() * 200 - 100;
      ball.ypos = Math.random() * 200 - 100;
      ball.zpos = Math.random() * 200 - 100;
      balls.add(ball);
    }
    
    rotateY (ball, angle) {
      var cos = Math.cos(angle),
          sin = Math.sin(angle),
          x1 = ball.xpos * cos - ball.zpos * sin,
          z1 = ball.zpos * cos + ball.xpos * sin;
      
      ball.xpos = x1;
      ball.zpos = z1;
      
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

    move (ball) {
      rotateY(ball, angleY);
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

      angleY = (mouse.x - vpX) * 0.001;
      balls.forEach(move);
      balls.sort(zSort);
      balls.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new rotatey().run();
}
