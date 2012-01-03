#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class lines3d1 {

  lines3d1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var balls = [],
        numBalls = 15,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleX = 0, 
        angleY = 0;
    
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball3d.withRadiusAndColor(5, "#000000");
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

    move (ball, i) {
      rotateX(ball, angleX);
      rotateY(ball, angleY);
      setPerspective(ball);
      //don't draw line to first ball
      if (i !== 0) {
        context.lineTo(balls[i].x, balls[i].y);
      }
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
      context.beginPath();
      //line starts at first ball
      context.moveTo(balls[0].x, balls[0].y);
      var i=0;
      balls.forEach((var b) { move(b,i); i++;});
      context.stroke();
      balls.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new lines3d1().run();
}
