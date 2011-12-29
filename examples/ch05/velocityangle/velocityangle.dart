#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class velocityangle {

  velocityangle() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angle = 45;
    var speed = 1;
    
    ball.x = 50;
    ball.y = 100;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var radians = angle * Math.PI / 180,
      vx = Math.cos(radians) * speed,
      vy = Math.sin(radians) * speed;
      
      ball.x += vx;
      ball.y += vy;
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new velocityangle().run();
}
