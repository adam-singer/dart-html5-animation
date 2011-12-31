#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');
#source('../classes/point.dart');

class nodegardenmass {

  nodegardenmass() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<Ball> particles = new List<Ball>();
    var numParticles = 30,
        minDist = 100,
        springAmount = 0.0005;
    
    for (var size, particle, i = 0; i < numParticles; i++) {
      size = Math.random() * 10 + 2;
      particle = new Ball.withRadiusAndColor(size, "#ffffff");
      particle.x = Math.random() * canvas.width;
      particle.y = Math.random() * canvas.height;
      particle.vx = Math.random() * 6 - 3;
      particle.vy = Math.random() * 6 - 3;
      particle.mass = size;
      particles.add(particle);
    }
    
    spring(var partA, var partB) {
      var dx = partB.x - partA.x,
      dy = partB.y - partA.y,
      dist = Math.sqrt(dx * dx + dy * dy);
  
      if (dist < minDist) {
        var alpha = 1 - dist / minDist;
        context.strokeStyle = utilslib.Utils.colorToRGB("#ffffff", alpha);
        context.beginPath();
        context.moveTo(partA.x, partA.y);
        context.lineTo(partB.x, partB.y);
        context.stroke();
        
        var ax = dx * springAmount,
            ay = dy * springAmount;
        partA.vx += ax / partA.mass;
        partA.vy += ay / partA.mass;
        partB.vx -= ax / partB.mass;
        partB.vy -= ay / partB.mass;
      }
    };
    
    move (var partA, var i) {
      partA.x += partA.vx;
      partA.y += partA.vy;
      if (partA.x > canvas.width) {
        partA.x = 0;
      } else if (partA.x < 0) {
        partA.x = canvas.width;
      }
      if (partA.y > canvas.height) {
        partA.y = 0;
      } else if (partA.y < 0) {
        partA.y = canvas.height;
      }
      for (var partB, j = i + 1; j < numParticles; j++) {
        partB = particles[j];
        spring(partA, partB);
      }
    };
    
    draw (var particle) {
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
  new nodegardenmass().run();
}
