#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
class acceleration1 {

  acceleration1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vx = 0;
    var ax = 0.1;
    
    ball.x = 50;
    ball.y = 100;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      vx += ax;
      ball.x += vx;
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new acceleration1().run();
}
