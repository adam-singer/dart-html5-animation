#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class billiard1 {

  billiard1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball0 = new Ball();
    var ball1 = new Ball();
    
    ball0.mass = 2;
    ball0.x = 50;
    ball0.y = canvas.height / 2;
    ball0.vx = 1;
    
    ball1.mass = 1;
    ball1.x = 300;
    ball1.y = canvas.height / 2;
    ball1.vx = -1;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      ball0.x += ball0.vx;
      ball1.x += ball1.vx;
      var dist = ball1.x - ball0.x;
      if (dist.abs() < ball0.radius + ball1.radius) {     
        var vx0Final = ((ball0.mass - ball1.mass) * ball0.vx + 2 * ball1.mass * ball1.vx) /
                       (ball0.mass + ball1.mass),
            vx1Final = ((ball1.mass - ball0.mass) * ball1.vx + 2 * ball0.mass * ball0.vx) /
                       (ball0.mass + ball1.mass);
        ball0.vx = vx0Final;
        ball1.vx = vx1Final;
        ball0.x += ball0.vx;
        ball1.y += ball1.vx;
      }
      ball0.draw(context);
      ball1.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new billiard1().run();
}
