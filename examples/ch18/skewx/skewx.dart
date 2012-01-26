#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

class skewx {

  skewx() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      var skewX = (mouse.x - canvas.width / 2) * 0.01,
      dx = canvas.width / 2,
      dy = canvas.height / 2;

      context.save();
      context.fillStyle = "#ff0000";
      context.transform(1, 0, skewX, 1, dx, dy);
      context.fillRect(-50, -50, 100, 100);
      context.restore();
    }
    drawFrame(0);
  }
}

void main() {
  new skewx().run();
}
