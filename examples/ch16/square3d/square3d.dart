#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');

class square3d {

  square3d() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var points = [],
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleX = 0, 
        angleY = 0;
    
    //create 4 points
    points.add(new Point3d(-100, -100, 100));
    points.add(new Point3d( 100, -100, 100));
    points.add(new Point3d( 100,  100, 100));
    points.add(new Point3d(-100,  100, 100));
    
    points.forEach((var point) {
      point.setVanishingPoint(vpX, vpY);
    });

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

      angleX = (mouse.y - vpY) * 0.0005;
      angleY = (mouse.x - vpX) * 0.0005;
      points.forEach(move);
      context.beginPath();
      context.moveTo(points[0].getScreenX(), points[0].getScreenY());
      var i=0;
      points.forEach((var p) {draw(p,i);i++;});
      context.closePath();
      context.stroke();
    }
    drawFrame(0);
  }
}

void main() {
  new square3d().run();
}
