#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');
class timebased2 {

  timebased2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball(), 
        start_time = new Date.now().value,        
        fps = 15,
        vx = 300,
        vy = -300,
        bounce = -0.7;
    
    ball.x = canvas.width * Math.random();
    ball.y = canvas.height / 2;
    
    getTimer () {
      return (new Date.now().value - start_time); //milliseconds
    }
    
    var time = getTimer();
    
    drawFrame() {
      
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
    }
    
    window.setInterval(drawFrame, (1000/fps).toInt());
        
  }
}

void main() {
  new timebased2().run();
}
