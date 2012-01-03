#import('dart:html');

class random7 {

  random7() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 300,
    iterations = 6;
    
    while (numDots--) {
      var xpos = 0;
      var ypos = 0;
      for (var i = 0; i < iterations; i++) {
        xpos += Math.random() * canvas.width;
      }
      for (var j = 0; j < iterations; j++) {
        ypos += Math.random() * canvas.height;
      }
      
      var x = xpos / iterations,
          y = ypos / iterations;
      
      context.fillStyle = "#000000";
      context.beginPath();
      //x, y, radius, start_angle, end_angle, anti-clockwise
      context.arc(x, y, 2, 0, (Math.PI * 2), true);
      context.closePath();
      context.fill();
    }
  }
}

void main() {
  new random7().run();
}
