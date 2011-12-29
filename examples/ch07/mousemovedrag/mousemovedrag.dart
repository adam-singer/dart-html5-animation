#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class mousemovedrag {

  mousemovedrag() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    onMouseMove(MouseEvent event) {
      ball.x = mouse.x;
      ball.y = mouse.y;
    };
    
    onMouseUp(MouseEvent event) {
      canvas.on.mouseUp.remove(onMouseUp, false);
      canvas.on.mouseMove.remove(onMouseMove, false);
    };
   
    canvas.on.mouseDown.add((MouseEvent event) {
      if (utilslib.Utils.containsPoint(ball.getBounds(), mouse.x, mouse.y)) {
        canvas.on.mouseUp.add(onMouseUp, false);
        canvas.on.mouseMove.add(onMouseMove, false);
      }
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new mousemovedrag().run();
}
