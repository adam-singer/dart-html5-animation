#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class bounce3d {

  bounce3d() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var xpos = 0,
        ypos = 0,
        zpos = 0,
        vx = Math.random() * 10 - 5,
        vy = Math.random() * 10 - 5,
        vz = Math.random() * 10 - 5,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        top = -100,
        bottom = 100,
        left = -100,
        right = 100,
        back = 100,
        front = -100;
   
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      xpos += vx;
      ypos += vy;
      zpos += vz;
      
      if (xpos + ball.radius > right) {
        xpos = right - ball.radius;
        vx *= -1;
      } else if (xpos - ball.radius < left) {
        xpos = left + ball.radius;
        vx *= -1;
      }
      if (ypos + ball.radius > bottom) {
        ypos = bottom - ball.radius;
        vy *= -1;
      } else if (ypos - ball.radius < top) {
        ypos = top + ball.radius;
        vy *= -1;
      }
      if (zpos + ball.radius > back) {
        zpos = back - ball.radius;
        vz *= -1;
      } else if (zpos - ball.radius < front) {
        zpos = front + ball.radius;
        vz *= -1;
      }
      if (zpos > -fl) {
        var scale = fl / (fl + zpos);
        ball.scaleX = ball.scaleY = scale;
        ball.x = vpX + xpos * scale;
        ball.y = vpY + ypos * scale;
        ball.visible = true;
      } else {
        ball.visible = false;
      }
      if (ball.visible) {
        ball.draw(context);
      }
    };
    drawFrame(0);
  }
}

void main() {
  new bounce3d().run();
}
