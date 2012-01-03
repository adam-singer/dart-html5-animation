#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class timebased1 {

  timebased1() {
  }
 
  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball(), 
        start_time = new Date.now().value,        
        vx = 300,
        vy = -300,
        bounce = -0.7;
     
   
    ball.x = canvas.width * Math.random();
    ball.y = canvas.height / 2;

    getTimer () {
      return (new Date.now().value - start_time); //milliseconds
    }
    
    var time = getTimer();
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var elapsed = getTimer() - time,
          left = 0,
          right = canvas.width,
          top = 0,
          bottom = canvas.height;
  
      time = getTimer();
      ball.x += vx * elapsed / 1000;
      ball.y += vy * elapsed / 1000;
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
      ball.draw(context);
  
    };
    drawFrame(0);
  }
}

void main() {
  new timebased1().run();
}
