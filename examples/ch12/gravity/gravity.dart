#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class gravity {

  gravity() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<Ball> particles = new List<Ball>();
    var numParticles = 30;
    
    for (var i = 0; i < numParticles; i++) {
      var particle = new Ball.withRadius(5);
      particle.x = Math.random() * canvas.width;
      particle.y = Math.random() * canvas.height;
      particle.mass = 1;
      particles.add(particle);
    }
    
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
        gravitate(partA, partB);
      }
    };
    
    draw(var particle) {
      particle.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

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
  new gravity().run();
}
