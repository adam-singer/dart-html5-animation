#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class oval {

  oval() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angle = 0;
    var centerX = canvas.width / 2;
    var centerY = canvas.height / 2;
    var radiusX = 150;
    var radiusY = 100;
    var speed = 0.05;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);

      ball.x = centerX + Math.sin(angle) * radiusX;
      ball.y = centerY + Math.cos(angle) * radiusY;
      angle += speed;
      
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new oval().run();
}
