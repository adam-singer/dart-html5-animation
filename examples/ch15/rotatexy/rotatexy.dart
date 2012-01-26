#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class rotatexy {

  rotatexy() {
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
        angleX = 0, 
        angleY = 0;
    
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball3d.withRadius(15);
      ball.xpos = Math.random() * 200 - 100;
      ball.ypos = Math.random() * 200 - 100;
      ball.zpos = Math.random() * 200 - 100;
      balls.add(ball);
    }
    
    rotateX (ball, angle) {                      
      var cos = Math.cos(angle),
          sin = Math.sin(angle),
          y1 = ball.ypos * cos - ball.zpos * sin,
          z1 = ball.zpos * cos + ball.ypos * sin;
      ball.ypos = y1;
      ball.zpos = z1;
    }
    
    rotateY (ball, angle) {
      var cos = Math.cos(angle),
          sin = Math.sin(angle),
          x1 = ball.xpos * cos - ball.zpos * sin,
          z1 = ball.zpos * cos + ball.xpos * sin;
      ball.xpos = x1;
      ball.zpos = z1;
    }

    setPerspective (ball) {
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
      rotateX(ball, angleX);
      rotateY(ball, angleY);
      setPerspective(ball);
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

      angleX = (mouse.y - vpY) * 0.001;
      angleY = (mouse.x - vpX) * 0.001;
      balls.forEach(move);
      balls.sort(zSort);
      balls.forEach(draw);
    
    }
    drawFrame(0);
  }
}

void main() {
  new rotatexy().run();
}
