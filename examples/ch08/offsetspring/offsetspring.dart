#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class offsetspring {

  offsetspring() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    var spring = 0.03,
        friction = 0.9,
        springLength = 100,
        vx = 0,
        vy = 0;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var dx = ball.x - mouse.x,
          dy = ball.y - mouse.y,
          angle = Math.atan2(dy, dx),
          targetX = mouse.x + Math.cos(angle) * springLength,
          targetY = mouse.y + Math.sin(angle) * springLength;

      vx += (targetX - ball.x) * spring;
      vy += (targetY - ball.y) * spring;
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
  new offsetspring().run();
}
