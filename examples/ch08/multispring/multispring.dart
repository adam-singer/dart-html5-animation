#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class multispring {

  multispring() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball.withRadius(20);
    List<Ball> handles = new List<Ball>();
    var numHandles = 3,
        spring = 0.03,
        friction = 0.9,
        movingHandle = null;
    
    for (var i = 0; i < numHandles; i++) {
      var handle = new Ball.withRadiusAndColor(10, "#0000ff");
      handle.x = Math.random() * canvas.width;
      handle.y = Math.random() * canvas.height;
      handles.add(handle);
    }
    
    canvas.on.mouseDown.add((MouseEvent event) {
      handles.forEach((var handle) {
        if (utilslib.Utils.containsPoint(handle.getBounds(), mouse.x, mouse.y)) {
          movingHandle = handle;
        }
      });
    }, false);
    
    canvas.on.mouseUp.add((MouseEvent event) {
      if (movingHandle != null) {
        movingHandle = null;
      }
    }, false);
    
    canvas.on.mouseMove.add((MouseEvent event) {
      if (movingHandle != null) {
        movingHandle.x = mouse.x;
        movingHandle.y = mouse.y;
      }
    }, false);
    
    applyHandle(var handle) {
      var dx = handle.x - ball.x,
          dy = handle.y - ball.y;
      ball.vx += dx * spring;
      ball.vy += dy * spring;
    };
    
    drawHandle(var handle) {
      context.moveTo(ball.x, ball.y);
      context.lineTo(handle.x, handle.y);
      context.stroke();
      handle.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      handles.forEach(applyHandle);
      ball.vx *= friction;
      ball.vy *= friction;
      ball.x += ball.vx;
      ball.y += ball.vy;
      context.beginPath();
      handles.forEach(drawHandle);
      ball.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new multispring().run();
}
