#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class wave1 {

  wave1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angle = 0;
    var centerY = 200;
    var range = 50;
    var xspeed = 1;
    var yspeed = 0.05;
    
    ball.x = 0;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
   
      ball.x += xspeed;
      ball.y = centerY / 2 + Math.sin(angle) * range;
      angle += yspeed;
   
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new wave1().run();
}
