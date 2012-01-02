#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class playball {

  playball() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball.withRadius(20);
    var segments = [];
    var numSegments = 5,
        gravity = 0.5,
        bounce = -0.9;
    point target;
    
    ball.vx = 10;

    while (numSegments--) {
      segments.add(new Segment(20, 10));
    }
    
    //center the last one
    segments[segments.length - 1].x = canvas.width / 2;
    segments[segments.length - 1].y = canvas.height / 2;
    
    moveBall () {
      ball.vy += gravity;
      ball.x += ball.vx;
      ball.y += ball.vy;
      if (ball.x + ball.radius > canvas.width) {
        ball.x = canvas.width - ball.radius;
        ball.vx *= bounce;
      } else if (ball.x - ball.radius < 0) {
        ball.x = ball.radius;
        ball.vx *= bounce;
      }
      if (ball.y + ball.radius > canvas.height) {
        ball.y = canvas.height - ball.radius;
        ball.vy *= bounce;
      } else if (ball.y - ball.radius < 0) {
        ball.y = ball.radius;
        ball.vy *= bounce;
      }
    }
    
    reach (segment, xpos, ypos) {
      var dx = xpos - segment.x,
          dy = ypos - segment.y;
      segment.rotation = Math.atan2(dy, dx);
      var w = segment.getPin().x - segment.x,
          h = segment.getPin().y - segment.y;
      return new point(xpos - w,ypos - h);
    }
    
    position (segmentA, segmentB) {
      segmentA.x = segmentB.getPin().x;
      segmentA.y = segmentB.getPin().y;
    }
    
    checkHit () {
      var segment = segments[0],
          dx = segment.getPin().x - ball.x,
          dy = segment.getPin().y - ball.y,
          dist = Math.sqrt(dx * dx + dy * dy);
      if (dist < ball.radius) {
        ball.vx += Math.random() * 2 - 1;
        ball.vy -= 1;
      }
    }
    
    move (segment, i) {
      if (i !== 0) {
        target = reach(segment, target.x, target.y);
        position(segments[i - 1], segment);
      }
    }

    draw (segment) {
      segment.draw(context);
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      moveBall();
      target = reach(segments[0], ball.x, ball.y);
      var i=0;
      segments.forEach((var s) { move(s, i); i++; });
      
      checkHit();
      
      segments.forEach(draw);
      ball.draw(context);
    }
    drawFrame(0);
  }
}

void main() {
  new playball().run();
}
