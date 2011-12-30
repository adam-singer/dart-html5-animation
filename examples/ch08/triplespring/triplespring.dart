#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class triplespring {

  triplespring() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball0 = new Ball.withRadius(20),
        ball1 = new Ball.withRadius(20),
        ball2 = new Ball.withRadius(20),
        ball0_dragging = false,
        ball1_dragging = false,
        ball2_dragging = false,
        spring = 0.03,
        friction = 0.9,
        springLength = 100,
        vx = 0,
        vy = 0;
    
    ball0.x = Math.random() * canvas.width;
    ball0.y = Math.random() * canvas.height;

    ball1.x = Math.random() * canvas.width;
    ball1.y = Math.random() * canvas.height;

    ball2.x = Math.random() * canvas.width;
    ball2.y = Math.random() * canvas.height;
    
    canvas.on.mouseDown.add((MouseEvent event) {
      if (utilslib.Utils.containsPoint(ball0.getBounds(), mouse.x, mouse.y)) {
        ball0_dragging = true;
      }
      if (utilslib.Utils.containsPoint(ball1.getBounds(), mouse.x, mouse.y)) {
        ball1_dragging = true;
      }
      if (utilslib.Utils.containsPoint(ball2.getBounds(), mouse.x, mouse.y)) {
        ball2_dragging = true;
      }
    }, false);
    
    canvas.on.mouseUp.add((MouseEvent event) {
      if (ball0_dragging || ball1_dragging || ball2_dragging) {
        ball0_dragging = false;
        ball1_dragging = false;
        ball2_dragging = false;
      }
    }, false);
    
    canvas.on.mouseMove.add((MouseEvent event) {
      if (ball0_dragging) {
        ball0.x = mouse.x;
        ball0.y = mouse.y;
      }
      if (ball1_dragging) {
        ball1.x = mouse.x;
        ball1.y = mouse.y;
      }
      if (ball2_dragging) {
        ball2.x = mouse.x;
        ball2.y = mouse.y;
      }
    }, false);
    
    springTo(var ballA, var ballB) {
      var dx = ballB.x - ballA.x,
      dy = ballB.y - ballA.y,
      angle = Math.atan2(dy, dx),
      targetX = ballB.x - Math.cos(angle) * springLength,
      targetY = ballB.y - Math.sin(angle) * springLength;

      ballA.vx += (targetX - ballA.x) * spring;
      ballA.vy += (targetY - ballA.y) * spring;
      ballA.vx *= friction;
      ballA.vy *= friction;
      ballA.x += ballA.vx;
      ballA.y += ballA.vy;
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      if (!ball0_dragging) {
        springTo(ball0, ball1);
        springTo(ball0, ball2);
      }
      if (!ball1_dragging) {
        springTo(ball1, ball0);
        springTo(ball1, ball2);
      }
      if (!ball2_dragging) {
        springTo(ball2, ball0);
        springTo(ball2, ball1);
      }
      context.beginPath();
      context.moveTo(ball0.x, ball0.y);
      context.lineTo(ball1.x, ball1.y);
      context.lineTo(ball2.x, ball2.y);
      context.lineTo(ball0.x, ball0.y);
      context.stroke();
      ball0.draw(context);
      ball1.draw(context);
      ball2.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new triplespring().run();
}
