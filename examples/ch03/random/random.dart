#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class random {

  random() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var angleX = 0;
    var angleY = 0;
    var range = 50;
    var centerX = canvas.width / 2;
    var centerY = canvas.height / 2;
    var xspeed = 0.07;
    var yspeed = 0.11;
     
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
   
      ball.x = centerX + Math.sin(angleX) * range;
      ball.y = centerY + Math.sin(angleY) * range;
      angleX += xspeed;
      angleY += yspeed;
   
      ball.draw(context);
    };
    
    drawFrame(0);    
  }

}

void main() {
  new random().run();
}
