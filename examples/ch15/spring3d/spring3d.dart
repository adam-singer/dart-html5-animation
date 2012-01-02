#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class spring3d {

  spring3d() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball3d(),
        tx = Math.random() * 500 - 250,
        ty = Math.random() * 500 - 250,
        tz = Math.random() * 500,
        spring = 0.1,
        friction = 0.94,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2;
    
    window.on.mouseDown.add((KeyboardEvent event) {
      tx = Math.random() * 500 - 250;
      ty = Math.random() * 500 - 250;
      tz = Math.random() * 500;
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      var dx = tx - ball.xpos,
      dy = ty - ball.ypos,
      dz = tz - ball.zpos;
  
      ball.vx += dx * spring;
      ball.vy += dy * spring;
      ball.vz += dz * spring;
      ball.xpos += ball.vx;
      ball.ypos += ball.vy;
      ball.zpos += ball.vz;
      ball.vx *= friction;
      ball.vy *= friction;
      ball.vz *= friction;
      
      if (ball.zpos > -fl) {
        var scale = fl / (fl + ball.zpos);
        ball.scaleX = ball.scaleY = scale;
        ball.x = vpX + ball.xpos * scale;
        ball.y = vpY + ball.ypos * scale;
        ball.visible = true;
      } else {
        ball.visible = false;
      }
      if (ball.visible) {
        ball.draw(context);
      }
    }
    drawFrame(0);
  }
}

void main() {
  new spring3d().run();
}
