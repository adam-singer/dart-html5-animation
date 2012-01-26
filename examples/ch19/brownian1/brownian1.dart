#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class brownian1 {

  brownian1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var dots = [],
        numDots = 50,
        friction = 0.95;
    
    for (var dot, i = 0; i < numDots; i++) {
      dot = new Ball.withRadiusAndColor(1, "#000000");
      dot.x = Math.random() * canvas.width;
      dot.y = Math.random() * canvas.height;
      dot.vx = 0;
      dot.vy = 0;
      dots.add(dot);
    }
    
    draw (dot) {
      dot.vx += Math.random() * 0.2 - 0.1;
      dot.vy += Math.random() * 0.2 - 0.1;
      dot.x += dot.vx;
      dot.y += dot.vy;
      dot.vx *= friction;
      dot.vy *= friction;
      
      if (dot.x > canvas.width) {
        dot.x = 0;
      } else if (dot.x < 0) {
        dot.x = canvas.width;
      }
      if (dot.y > canvas.height) {
        dot.y = 0;
      } else if (dot.y < 0) {
        dot.y = canvas.height;
      }
      dot.draw(context);
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      dots.forEach(draw);
    };
    drawFrame(0);
  }
}

void main() {
  new brownian1().run();
}
