#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class touchevents {

  touchevents() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    // var _touch = utilslib.Utils.captureTouch(canvas);
    var _touch = utilslib.Utils.captureMouse(canvas);
    var log = document.query('#log');
    var ball = new Ball();
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    ball.draw(context);
    
    canvas.on.touchStart.add((TouchEvent event) {
      if(utilslib.Utils.containsPoint(ball.getBounds(), _touch.x, _touch.y)) {
        log.value = "in ball: touchstart";
      } else {
        log.value = "canvas: touchstart";
      }
    }, false);
    
    canvas.on.touchEnd.add((TouchEvent event) {
      event.preventDefault();
      log.value = "canvas: touchend";
    }, false);
    
    canvas.on.touchMove.add((TouchEvent event) {
      event.preventDefault();
      if(utilslib.Utils.containsPoint(ball.getBounds(), _touch.x, _touch.y)) { 
        log.value = "in ball: touchmove";
      } else {
        log.value = "canvas: touchmove";
      }
    }, false);
  }


}

void main() {
  new touchevents().run();
}
