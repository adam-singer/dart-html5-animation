#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class spring5 {

  spring5() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    var spring = 0.03,
        friction = 0.9,
        gravity = 2,
        vx = 0,
        vy = 0;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);   
      context.clearRect(0, 0, canvas.width, canvas.height);

      var dx = mouse.x - ball.x,
          dy = mouse.y - ball.y,
          ax = dx * spring,
          ay = dy * spring;

      vx += ax;
      vy += ay;
      vy += gravity;
      vx *= friction;
      vy *= friction;
      ball.x += vx;
      ball.y += vy;
      context.beginPath();
      context.moveTo(ball.x, ball.y);
      context.lineTo(mouse.x, mouse.y);
      context.stroke();
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new spring5().run();
}
