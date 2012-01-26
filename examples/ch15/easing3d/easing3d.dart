#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class easing3d {

  easing3d() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball3d(),
        tx = Math.random() * 500 - 250,
        ty = Math.random() * 500 - 250,
        tz = Math.random() * 500,
        easing = 0.1,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var dx = tx - ball.xpos,
      dy = ty - ball.ypos,
      dz = tz - ball.zpos,
      dist = Math.sqrt(dx * dx + dy * dy + dz * dz);
  
      ball.xpos += dx * easing;
      ball.ypos += dy * easing;
      ball.zpos += dz * easing;
      
      if (dist < 1) {
        tx = Math.random() * 500 - 250;
        ty = Math.random() * 500 - 250;
        tz = Math.random() * 500;
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
      if (ball.visible) {
        ball.draw(context);
      }
    }
    drawFrame(0);
  }
}

void main() {
  new easing3d().run();
}
