#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');

class gravity {

  gravity() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var vx = 0;
    var vy = 0;
    var ax = 0;
    var ay = 0;
    var _gravity = 0.02;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    window.on.keyDown.add((KeyboardEvent event){
      switch (event.keyCode) {
      case 37:      //left
        ax = -0.1;
        break;
      case 39:      //right
        ax = 0.1;
        break;
      case 38:      //up
        ay = -0.1;
        break;
      case 40:      //down
        ay = 0.1;
        break;
      }
    }, false);
    
    window.on.keyUp.add((KeyboardEvent event) {
      ax = 0;
      ay = 0;
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      vx += ax;
      vy += ay;
      vy += _gravity;
      ball.x += vx;
      ball.y += vy;
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new gravity().run();
}
