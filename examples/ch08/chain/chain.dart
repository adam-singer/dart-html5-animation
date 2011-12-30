#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class chain {

  chain() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball0 = new Ball(),
        ball1 = new Ball(),
        ball2 = new Ball(),
        spring = 0.03,
        friction = 0.9,
        gravity = 2;
    
    move(var ball, var targetX, var targetY) {
      ball.vx += (targetX - ball.x) * spring;
      ball.vy += (targetY - ball.y) * spring;
      ball.vy += gravity;
      ball.vx *= friction;
      ball.vy *= friction;
      ball.x += ball.vx;
      ball.y += ball.vy;
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      move(ball0, mouse.x, mouse.y);
      move(ball1, ball0.x, ball0.y);
      move(ball2, ball1.x, ball1.y);

      //draw spring
      context.beginPath();
      context.moveTo(mouse.x, mouse.y);
      context.lineTo(ball0.x, ball0.y);
      context.lineTo(ball1.x, ball1.y);
      context.lineTo(ball2.x, ball2.y);
      context.stroke();

      //draw balls
      ball0.draw(context);
      ball1.draw(context);
      ball2.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new chain().run();
}
