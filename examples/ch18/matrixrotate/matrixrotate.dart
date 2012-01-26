#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

class matrixrotate {

  matrixrotate() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var angle = 0;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      angle += 0.03;
      var cos = Math.cos(angle),
          sin = Math.sin(angle),
          dx = canvas.width / 2,
          dy = canvas.height / 2;

      context.save();
      context.fillStyle = "#ff0000";
      context.transform(cos, sin, -sin, cos, dx, dy);
      context.fillRect(-50, -50, 100, 100);
      context.restore();
    }
    drawFrame(0);
  }
}

void main() {
  new matrixrotate().run();
}
