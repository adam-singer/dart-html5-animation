#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class spring3 {

  spring3() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball(); 
    var spring = 0.03,
    friction = 0.95,
    targetX = canvas.width / 2,
    targetY = canvas.height / 2,
    vx = 0,
    vy = 0;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var dx = targetX - ball.x,
          dy = targetY - ball.y,
          ax = dx * spring,
          ay = dy * spring;

      vx += ax;
      vy += ay;
      vx *= friction;
      vy *= friction;
      ball.x += vx;
      ball.y += vy;
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new spring3().run();
}
