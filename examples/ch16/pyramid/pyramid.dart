#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');
#source('../classes/triangle.dart');

class pyramid {

  pyramid() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var points = [],
        triangles = [],
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleX = 0, 
        angleY = 0;
    
    //pyramid
    points.add(new Point3d(   0, -100,    0));
    points.add(new Point3d( 100,  100, -100));
    points.add(new Point3d(-100,  100, -100));
    points.add(new Point3d(-100,  100,  100));
    points.add(new Point3d( 100,  100,  100));
    
    points.forEach((var point) {
      point.setVanishingPoint(vpX, vpY);
      point.setCenter(0, 0, 200);
    });

    triangles.add(new Triangle(points[0], points[1], points[2], "#6666cc"));
    triangles.add(new Triangle(points[0], points[2], points[3], "#66cc66"));
    triangles.add(new Triangle(points[0], points[3], points[4], "#cc6666"));
    triangles.add(new Triangle(points[0], points[4], points[1], "#66cccc"));
    triangles.add(new Triangle(points[1], points[3], points[2], "#cc66cc"));
    triangles.add(new Triangle(points[1], points[4], points[3], "#cc66cc"));

    move (point) {
      point.rotateX(angleX);
      point.rotateY(angleY);
    }

    draw (triangle) {
      triangle.draw(context);
    }

    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      angleX = (mouse.y - vpY) * 0.0005;
      angleY = (mouse.x - vpX) * 0.0005;
      points.forEach(move);
      triangles.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new pyramid().run();
}
