#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class easingoff {

  easingoff() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var log = document.query('#log');
    var ball = new Ball(),
        easing = 0.05,
        targetX = canvas.width / 2;
        
    
    ball.y = canvas.height / 2;
    
    drawFrame(int t) {
      var animRequest = document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var dx = targetX - ball.x;

      if (dx.abs() < 1) {
        ball.x = targetX;
        document.window.webkitCancelRequestAnimationFrame(animRequest);
        log.value = "Animation done!";
      } else {
        var vx = dx * easing;
        ball.x += vx;
      }
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new easingoff().run();
}
