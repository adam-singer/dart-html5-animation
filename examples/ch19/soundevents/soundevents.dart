#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');
#source('../classes/point.dart');

class soundevents {

  soundevents() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    MediaElement sound = document.query('#sound');
    var ball = new Ball(),
        vx = Math.random() * 10 - 5,
        vy = Math.random() * 10 - 5,
        bounce = -0.7;
    
    ball.x = canvas.width / 2;
    ball.y = canvas.height / 2;
    
    
    if (!(sound is MediaElement && sound.canPlayType('audio/ogg').endsWith('maybe'))) {
      throw new Exception("The audio element is not supported in this browser.");
    }
    
    drawFrame(int t) {
      window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var left = 0,
          right = canvas.width,
          top = 0,
          bottom = canvas.height;

      ball.x += vx;
      ball.y += vy;
    
      if (ball.x + ball.radius > right) {
        sound.play();
        ball.x = right - ball.radius;
        vx *= bounce;
      } else if (ball.x - ball.radius < left) {
        sound.play();
        ball.x = left + ball.radius;
        vx *= bounce;
      }
      if (ball.y + ball.radius > bottom) {
        sound.play();
        ball.y = bottom - ball.radius;
        vy *= bounce;
      } else if (ball.y - ball.radius < top) {
        sound.play();
        ball.y = top + ball.radius;
        vy *= bounce;
      }
      ball.draw(context);
    }
    drawFrame(0);
  }
}

void main() {
  new soundevents().run();
}
