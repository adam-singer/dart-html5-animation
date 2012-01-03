#import('dart:html');

class random6 {

  random6() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 300,
    iterations = 6;
    
    while (numDots--) {
      var xpos = 0;
      for (var i = 0; i < iterations; i++) {
        xpos += Math.random() * canvas.width;
      }
      var x = xpos / iterations,
          y = canvas.height / 2 + Math.random() * 50 - 25;
      
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
  new random6().run();
}
