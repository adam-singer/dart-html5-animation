#import('dart:html');

class random5 {

  random5() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 300;
    
    while (numDots--) {
      var x1 = Math.random() * canvas.width,
          x2 = Math.random() * canvas.width,
          x = (x1 + x2) / 2,
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
  new random5().run();
}
