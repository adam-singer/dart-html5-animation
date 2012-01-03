#import('dart:html');

class random1 {

  random1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var numDots = 50;
    
    while (numDots--) {
      var x = canvas.width / 2 + Math.random() * 200 - 100,
          y = canvas.height / 2 + Math.random() * 200 - 100;

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
  new random1().run();
}
