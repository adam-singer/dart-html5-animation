#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
class bobbing2 {

  bobbing2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angle = 0;
    var centerY = 200;
    var range = 50;
    var speed = 0.05;
    
    ball.x = canvas.width / 2;
    
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
      
      //ball.y = canvas.height / 2 + Math.sin(angle) * 50;
      ball.y = centerY / 2 + Math.sin(angle) * range;
      angle += speed;
      ball.draw(context);
    };
    
    drawFrame(0);
  }


}

void main() {
  new bobbing2().run();
}
