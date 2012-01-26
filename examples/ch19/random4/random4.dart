#import('dart:html');

class random4 {

  random4() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 300;
    var maxRadius = 50;
    
    while (numDots--) {
      var radius = Math.sqrt(Math.random()) * maxRadius,
          angle = Math.random() * (Math.PI * 2),
          x = canvas.width / 2 + Math.cos(angle) * radius,
          y = canvas.height / 2 + Math.sin(angle) * radius;

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
  new random4().run();
}
