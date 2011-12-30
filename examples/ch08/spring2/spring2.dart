#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class spring2 {

  spring2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball(); 
    var spring = 0.03,
    friction = 0.95,
    targetX = canvas.width / 2,
    vx = 0;
    
    ball.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var dx = targetX - ball.x,
          ax = dx * spring;

      vx += ax;
      vx *= friction;
      ball.x += vx;
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new spring2().run();
}
