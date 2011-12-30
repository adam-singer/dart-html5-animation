#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class easing1 {

  easing1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var easing = 0.05,
        targetX = canvas.width / 2,
        targetY = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var vx = (targetX - ball.x) * easing,
          vy = (targetY - ball.y) * easing;

      ball.x += vx;
      ball.y += vy;
      ball.draw(context);
    }
    drawFrame(0);
  }
}

void main() {
  new easing1().run();
}
