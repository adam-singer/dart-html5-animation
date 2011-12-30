#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class distance1 {

  distance1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var log = document.query('#log');
    var ballA = new Ball.withRadius(30);
    var ballB = new Ball.withRadius(30);
    
    ballA.x = canvas.width / 2;
    ballA.y = canvas.height / 2;
    
    drawFrame(MouseEvent event) {
      context.clearRect(0, 0, canvas.width, canvas.height);

      ballB.x = mouse.x;
      ballB.y = mouse.y;
      
      var dx = ballB.x - ballA.x,
          dy = ballB.y - ballA.y,
          dist = Math.sqrt(dx * dx + dy * dy);

      if (dist < 60) {
        log.value = "Hit!";
      } else {
        log.value = '';
      }
      ballA.draw(context);
      ballB.draw(context);
    };
    
    canvas.on.mouseMove.add(drawFrame, false);
    drawFrame(null);
  }
}

void main() {
  new distance1().run();
}
