#import('dart:html');

class random2 {

  random2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 300;
    
    while (numDots--) {
      var x = canvas.width / 2 + Math.random() * 100 - 50,
          y = canvas.height / 2 + Math.random() * 100 - 50;

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
  new random2().run();
}
