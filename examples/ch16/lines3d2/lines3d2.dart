#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');

class lines3d2 {

  lines3d2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var points = [],
        numPoints = 50,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleX = 0, 
        angleY = 0;
    
    for (var point, i = 0; i < numPoints; i++) {
      point = new Point3d(Math.random() * 200 - 100,
                          Math.random() * 200 - 100,
                          Math.random() * 200 - 100);
      point.setVanishingPoint(vpX, vpY);
      points.add(point);
    }
    
    move (point) {
      point.rotateX(angleX);
      point.rotateY(angleY);
    }

    draw (point, i) {
      if (i !== 0) {
        context.lineTo(point.getScreenX(), point.getScreenY());
      }
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      angleX = (mouse.y - vpY) * 0.001;
      angleY = (mouse.x - vpX) * 0.001;
      points.forEach(move);
      context.beginPath();
      //line starts at first point
      context.moveTo(points[0].getScreenX(), points[0].getScreenY());
      var i=0;
      points.forEach((var p) { draw(p,i); i++;});
      context.stroke();
    }
    drawFrame(0);
  }
}

void main() {
  new lines3d2().run();
}
