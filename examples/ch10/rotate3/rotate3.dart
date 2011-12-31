#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class rotate3 {

  rotate3() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    List<Ball> balls = new List<Ball>();
    var numBalls = 10,
        vr = 0.05,
        centerX = canvas.width / 2,
        centerY = canvas.height / 2,
        cos, sin; //accessible by move and drawFrame
   
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball();
      ball.x = Math.random() * canvas.width;
      ball.y = Math.random() * canvas.height;
      balls.add(ball);
    }
    
    move (var ball) {
      var x1 = ball.x - centerX,
          y1 = ball.y - centerY,
          x2 = cos * x1 - sin * y1,
          y2 = cos * y1 + sin * x1;
      ball.x = centerX + x2;
      ball.y = centerY + y2;
    };
    
    draw (var ball) {
      ball.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var angle = (mouse.x - centerX) * 0.0005;
      cos = Math.cos(angle);
      sin = Math.sin(angle);
      balls.forEach(move);
      balls.forEach(draw);
    };
    drawFrame(0);
  }
}

void main() {
  new rotate3().run();
}
