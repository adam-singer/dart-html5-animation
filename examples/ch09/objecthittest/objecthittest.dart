#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class objecthittest {

  objecthittest() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var log = document.query('#log');
    var ballA = new Ball(),
        ballB = new Ball();
       
    ballA.x = canvas.width / 2;
    ballA.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      ballB.x = mouse.x;
      ballB.y = mouse.y;
      
      if (utilslib.Utils.intersects(ballA.getBounds(), ballB.getBounds())) {
        log.value = "Hit!";
      } else {
        log.value = '';
      }
      
      ballA.draw(context);
      ballB.draw(context);
      
      //draw bounding boxes
      var boundsA = ballA.getBounds(),
          boundsB = ballB.getBounds();

      context.strokeRect(boundsA.x, boundsA.y, boundsA.width, boundsA.height);
      context.strokeRect(boundsB.x, boundsB.y, boundsB.width, boundsB.height);
    };
    
    drawFrame(0);
  }
}

void main() {
  new objecthittest().run();
}
