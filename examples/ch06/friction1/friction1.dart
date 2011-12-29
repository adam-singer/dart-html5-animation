#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class friction1 {

  friction1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vx = Math.random() * 10 - 5,
    vy = Math.random() * 10 - 5,
    friction = 0.1;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var speed = Math.sqrt(vx * vx + vy * vy),
          angle = Math.atan2(vy, vx);

      if (speed > friction) {
        speed -= friction;
      } else {
        speed = 0;
      }
      vx = Math.cos(angle) * speed;
      vy = Math.sin(angle) * speed;
      ball.x += vx;
      ball.y += vy;
      ball.draw(context);
    };
    drawFrame(0);
  }


}

void main() {
  new friction1().run();
}
