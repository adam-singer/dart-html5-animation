#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class easetomove {

  easetomove() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    var easing = 0.05;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var vx = (mouse.x - ball.x) * easing,
          vy = (mouse.y - ball.y) * easing;

      ball.x += vx;
      ball.y += vy;
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new easetomove().run();
}
