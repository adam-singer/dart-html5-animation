#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');
class mouseevents {

  mouseevents() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var log = document.query('#log');
    var ball = new Ball();
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    ball.draw(context);
    
    canvas.on.mouseDown.add((MouseEvent e) {
      if (utilslib.Utils.containsPoint(ball.getBounds(), mouse.x, mouse.y)) {
        log.value = "in ball: mousedown";
      }  else {
        log.value = "canvas: mousedown";
      }
    }, false);
    
    canvas.on.mouseUp.add((MouseEvent e) {
      if (utilslib.Utils.containsPoint(ball.getBounds(), mouse.x, mouse.y)) {
        log.value = "in ball: mouseup";
      } else {
        log.value = "canvas: mouseup";
      }
    }, false);
      
    canvas.on.mouseMove.add((MouseEvent e) {
      if (utilslib.Utils.containsPoint(ball.getBounds(), mouse.x, mouse.y)) {
        log.value = "in ball: mousemove";
      } else {
        log.value = "canvas: mousemove";
      }
    }, false);
  }

}

void main() {
  new mouseevents().run();
}
