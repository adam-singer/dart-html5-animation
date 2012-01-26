#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class easing2 {

  easing2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    var easing = 0.05,
        targetX = canvas.width / 2,
        targetY = canvas.height / 2,
        isMouseDown = false;
    
    onMouseMove(MouseEvent event) {
      ball.x = mouse.x;
      ball.y = mouse.y;
    };
    
    onMouseUp(MouseEvent event) {
      isMouseDown = false;
      canvas.on.mouseUp.remove(onMouseUp, false);
      canvas.on.mouseMove.remove(onMouseMove, false);
    };
   
    canvas.on.mouseDown.add((MouseEvent event) {
      if (utilslib.Utils.containsPoint(ball.getBounds(), mouse.x, mouse.y)) {
        isMouseDown = true;
        canvas.on.mouseUp.add(onMouseUp, false);
        canvas.on.mouseMove.add(onMouseMove, false);
      }
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      if (!isMouseDown) {
        var vx = (targetX - ball.x) * easing,
            vy = (targetY - ball.y) * easing;
        ball.x += vx;
        ball.y += vy;
      }
      ball.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new easing2().run();
}
