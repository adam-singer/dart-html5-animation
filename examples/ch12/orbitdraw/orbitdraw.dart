#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');
#source('../classes/point.dart');

class orbitdraw {

  orbitdraw() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<Ball> particles = new List<Ball>();
    var numParticles = 2;
    var sun = new Ball.withRadiusAndColor(100, "#ffff00"),
    planet = new Ball.withRadiusAndColor(1, "#000000");
    
    sun.x = canvas.width / 2;
    sun.y = canvas.height / 2;
    sun.mass = 10000;
    particles.add(sun);

    planet.x = canvas.width / 2 + 200;
    planet.y = canvas.height / 2;
    planet.vy = 7;
    planet.mass = 1;
    particles.add(planet);
    
    rotate (var x, var y, var sin, var cos, var reverse) {
      return new point(
        (reverse) ? (x * cos + y * sin) : (x * cos - y * sin),
        (reverse) ? (y * cos - x * sin) : (y * cos + x * sin)
      );
    };
    
    checkCollision(var ball0, var ball1) {
      var dx = ball1.x - ball0.x,
      dy = ball1.y - ball0.y,
      dist = Math.sqrt(dx * dx + dy * dy);
      //collision handling code here
      if (dist < ball0.radius + ball1.radius) {
        //calculate angle, sine, and cosine
        var angle = Math.atan2(dy, dx),
            sin = Math.sin(angle),
            cos = Math.cos(angle),
            //rotate ball0's position
            pos0 = new point(0,0), //point
            //rotate ball1's position
            pos1 = rotate(dx, dy, sin, cos, true),
            //rotate ball0's velocity
            vel0 = rotate(ball0.vx, ball0.vy, sin, cos, true),
            //rotate ball1's velocity
            vel1 = rotate(ball1.vx, ball1.vy, sin, cos, true),
            //collision reaction
            vxTotal = vel0.x - vel1.x;
        vel0.x = ((ball0.mass - ball1.mass) * vel0.x + 2 * ball1.mass * vel1.x) /
                 (ball0.mass + ball1.mass);
        vel1.x = vxTotal + vel0.x;
        //update position - to avoid objects becoming stuck together
        var absV = vel0.x.abs() + vel1.x.abs(),
            overlap = (ball0.radius + ball1.radius) - (pos0.x - pos1.x).abs();
        pos0.x += vel0.x / absV * overlap;
        pos1.x += vel1.x / absV * overlap;
        //rotate positions back
        var pos0F = rotate(pos0.x, pos0.y, sin, cos, false),
            pos1F = rotate(pos1.x, pos1.y, sin, cos, false);
        //adjust positions to actual screen positions
        ball1.x = ball0.x + pos1F.x;
        ball1.y = ball0.y + pos1F.y;
        ball0.x = ball0.x + pos0F.x;
        ball0.y = ball0.y + pos0F.y;
        //rotate velocities back
        var vel0F = rotate(vel0.x, vel0.y, sin, cos, false),
            vel1F = rotate(vel1.x, vel1.y, sin, cos, false);
        ball0.vx = vel0F.x;
        ball0.vy = vel0F.y;
        ball1.vx = vel1F.x;
        ball1.vy = vel1F.y;
      }
    };
    
    gravitate(var partA, var partB) {
      var dx = partB.x - partA.x,
      dy = partB.y - partA.y,
      distSQ = dx * dx + dy * dy,
      dist = Math.sqrt(distSQ),
      force = partA.mass * partB.mass / distSQ,
      ax = force * dx / dist,
      ay = force * dy / dist;
      partA.vx += ax / partA.mass;
      partA.vy += ay / partA.mass;
      partB.vx -= ax / partB.mass;
      partB.vy -= ay / partB.mass;
    };
    
    move(var partA, var i) {
      partA.x += partA.vx;
      partA.y += partA.vy;
      for (var partB, j = i + 1; j < numParticles; j++) {
        partB = particles[j];
        checkCollision(partA, partB);
        gravitate(partA, partB);
      }
    };
    
    draw(var particle) {
      particle.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);

      var i=0;
      particles.forEach((var p) {
        move(p,i); i++;
      });
      particles.forEach(draw);
    };
    drawFrame(0);
  }
}

void main() {
  new orbitdraw().run();
}
