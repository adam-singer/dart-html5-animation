#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class pluse {

  pluse() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angle = 0;
    var centerScale = 1;
    var range = 0.5;   
    var speed = 0.05;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
   
      ball.scaleX = ball.scaleY = centerScale + Math.sin(angle) * range;
      angle += speed;
   
      ball.draw(context);
    };
    
    drawFrame(0);
  }


}

void main() {
  new pluse().run();
}
