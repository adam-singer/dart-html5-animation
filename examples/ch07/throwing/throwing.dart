#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class throwing {

  throwing() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    var vx = Math.random() * 10 - 5,
    vy = -10,
    bounce = -0.7,
    gravity = 0.2,
    isMouseDown = false,
    oldX,
    oldY;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
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
        oldX = ball.x;
        oldY = ball.y;
        canvas.on.mouseUp.add(onMouseUp, false);
        canvas.on.mouseMove.add(onMouseMove, false);
      }
    }, false);
    
    trackVelocity() {
      vx = ball.x - oldX;
      vy = ball.y - oldY;
      oldX = ball.x;
      oldY = ball.y;
    };
    
    checkBoundaries() {
      var left = 0,
      right = canvas.width,
      top = 0,
      bottom = canvas.height;
  
      vy += gravity;
      ball.x += vx;
      ball.y += vy;
      //boundary detect and bounce
      if (ball.x + ball.radius > right) {
        ball.x = right - ball.radius;
        vx *= bounce;
      } else if (ball.x - ball.radius < left) {
        ball.x = left + ball.radius;
        vx *= bounce;
      }
      if (ball.y + ball.radius > bottom) {
        ball.y = bottom - ball.radius;
        vy *= bounce;
      } else if (ball.y - ball.radius < top) {
        ball.y = top + ball.radius;
        vy *= bounce;
      }
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      if (isMouseDown) {
        trackVelocity();
      } else {
        checkBoundaries();
      }
      
      ball.draw(context);
    };
    
    drawFrame(0); 
  }
}

void main() {
  new throwing().run();
}
