#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');
#source('../classes/triangle.dart');

class triangles1 {

  triangles1() {
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
    
    //the letter 'A', using 11 points
    points.add(new Point3d( -50, -250, 100));
    points.add(new Point3d(  50, -250, 100));
    points.add(new Point3d( 200,  250, 100));
    points.add(new Point3d( 100,  250, 100));
    points.add(new Point3d(  50,  100, 100));
    points.add(new Point3d( -50,  100, 100));
    points.add(new Point3d(-100,  250, 100));
    points.add(new Point3d(-200,  250, 100));
    points.add(new Point3d(   0, -150, 100));
    points.add(new Point3d(  50,    0, 100));
    points.add(new Point3d( -50,    0, 100));
    
    points.forEach(function (point) {
      point.setVanishingPoint(vpX, vpY);
      point.setCenter(0, 0, 200);
    });

    //create 11 triangle objects from our points
    triangles.add(new Triangle(points[0], points[1],  points[8],  "#ffcccc"));
    triangles.add(new Triangle(points[1], points[9],  points[8],  "#ffcccc"));
    triangles.add(new Triangle(points[1], points[2],  points[9],  "#ffcccc"));
    triangles.add(new Triangle(points[2], points[4],  points[9],  "#ffcccc"));
    triangles.add(new Triangle(points[2], points[3],  points[4],  "#ffcccc"));
    triangles.add(new Triangle(points[4], points[5],  points[9],  "#ffcccc"));
    triangles.add(new Triangle(points[9], points[5],  points[10], "#ffcccc"));
    triangles.add(new Triangle(points[5], points[6],  points[7],  "#ffcccc"));
    triangles.add(new Triangle(points[5], points[7],  points[10], "#ffcccc"));
    triangles.add(new Triangle(points[0], points[10], points[7],  "#ffcccc"));
    triangles.add(new Triangle(points[0], points[8],  points[10], "#ffcccc"));

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
  new triangles1().run();
}
