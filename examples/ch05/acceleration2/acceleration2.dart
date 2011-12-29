#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class acceleration2 {

  acceleration2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vx = 0;
    var ax = 0;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    window.on.keyDown.add((KeyboardEvent event) {
      if (event.keyCode === 37) {         //left
        ax = -0.1;
      } else if (event.keyCode === 39) {  //right
        ax = 0.1;
      }
    }, false);
    
    window.on.keyUp.add((KeyboardEvent event) {
      ax = 0;
    }, false);
    
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
  new acceleration2().run();
}
