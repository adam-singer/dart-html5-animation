#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class rotate1 {

  rotate1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vr = 0.05,
        angle = 0,
        radius = 150,
        centerX = canvas.width / 2,
        centerY = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      ball.x = centerX + Math.cos(angle) * radius;
      ball.y = centerY + Math.sin(angle) * radius;
      angle += vr;
      
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new rotate1().run();
}
