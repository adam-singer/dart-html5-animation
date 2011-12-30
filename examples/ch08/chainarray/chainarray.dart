#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class chainarray {

  chainarray() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    List<Ball> balls = new List<Ball>();
    var numBalls = 5,
        spring = 0.03,
        friction = 0.9,
        gravity = 2;
    
    while (numBalls--) {
      balls.add(new Ball.withRadius(20));
    }
    
    move (var ball, var targetX, var targetY) {
      ball.vx += (targetX - ball.x) * spring;
      ball.vy += (targetY - ball.y) * spring;
      ball.vy += gravity;
      ball.vx *= friction;
      ball.vy *= friction;
      ball.x += ball.vx;
      ball.y += ball.vy;
    };
    
    draw (ballB, i) {
      //if first ball, move to mouse
      if (i === 0) {
        move(ballB, mouse.x, mouse.y);
        context.moveTo(mouse.x, mouse.y);
      } else {
        var ballA = balls[i-1];
        move(ballB, ballA.x, ballA.y);
        context.moveTo(ballA.x, ballA.y);
      }
      context.lineTo(ballB.x, ballB.y);
      context.stroke();
      ballB.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      context.beginPath();
      var i=0;
      balls.forEach(f(var b) {
        draw(b, i);
        i++;
      });
    };
    drawFrame(0);
  }
}

void main() {
  new chainarray().run();
}
