#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class pointhittest {

  pointhittest() {
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
    
    canvas.on.mouseMove.add((MouseEvent event) {
      if (utilslib.Utils.containsPoint(ball.getBounds(), mouse.x, mouse.y)) {
        log.value = "Hit!";
      } else {
        log.value = '';
      }
    }, false);
  }
}

void main() {
  new pointhittest().run();
}
