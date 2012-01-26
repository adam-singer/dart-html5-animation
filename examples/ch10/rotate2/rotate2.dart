#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class rotate2 {

  rotate2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vr = 0.05,
        cos = Math.cos(vr),
        sin = Math.sin(vr),
        centerX = canvas.width / 2,
        centerY = canvas.height / 2;
    
    ball.x = Math.random() * canvas.width;
    ball.y = Math.random() * canvas.height;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var x1 = ball.x - centerX,
          y1 = ball.y - centerY,
          x2 = cos * x1 - sin * y1,
          y2 = cos * y1 + sin * x1;
      
      ball.x = centerX + x2;
      ball.y = centerY + y2;
      
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new rotate2().run();
}
