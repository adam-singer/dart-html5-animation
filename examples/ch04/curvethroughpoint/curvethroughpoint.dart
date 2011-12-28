#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

class curvethroughpoint {

  curvethroughpoint() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var x0 = 100,
    y0 = 200,
    x2 = 300,
    y2 = 200;
    
    canvas.on.mouseMove.add((MouseEvent e) {
      context.clearRect(0, 0, canvas.width, canvas.height);

      var x1 = mouse.x * 2 - (x0 + x2) / 2,
          y1 = mouse.y * 2 - (y0 + y2) / 2;

      //curve through mouse
      context.beginPath();
      context.moveTo(x0, y0);
      context.quadraticCurveTo(x1, y1, x2, y2);
      context.stroke();
    }, false);
  }
}

void main() {
  new curvethroughpoint().run();
}
