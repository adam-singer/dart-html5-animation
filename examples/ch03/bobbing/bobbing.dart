#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
class bobbing {

  bobbing() {
 
  }

  void run() {
    
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angle = 0;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
      
      ball.y = canvas.height / 2 + Math.sin(angle) * 50;
      angle += 0.1;
      ball.draw(context);
    };
    
    drawFrame(0);
    
  }


}

void main() {
  new bobbing().run();
}
