#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');
#source('../classes/triangle.dart');

class extrudedadepth {

  extrudedadepth() {
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
    
    //first set
    points.add(new Point3d( -50, -250, -50));
    points.add(new Point3d(  50, -250, -50));
    points.add(new Point3d( 200,  250, -50));
    points.add(new Point3d( 100,  250, -50));
    points.add(new Point3d(  50,  100, -50));
    points.add(new Point3d( -50,  100, -50));
    points.add(new Point3d(-100,  250, -50));
    points.add(new Point3d(-200,  250, -50));
    points.add(new Point3d(   0, -150, -50));
    points.add(new Point3d(  50,    0, -50));
    points.add(new Point3d( -50,    0, -50));
    //second set
    points.add(new Point3d( -50, -250,  50));
    points.add(new Point3d(  50, -250,  50));
    points.add(new Point3d( 200,  250,  50));
    points.add(new Point3d( 100,  250,  50));
    points.add(new Point3d(  50,  100,  50));
    points.add(new Point3d( -50,  100,  50));
    points.add(new Point3d(-100,  250,  50));
    points.add(new Point3d(-200,  250,  50));
    points.add(new Point3d(   0, -150,  50));
    points.add(new Point3d(  50,    0,  50));
    points.add(new Point3d( -50,    0,  50));
    
    points.forEach(function (point) {
      point.setVanishingPoint(vpX, vpY);
      point.setCenter(0, 0, 200);
    });

    triangles.add(new Triangle(points[0],  points[1],  points[8],  "#6666cc"));
    triangles.add(new Triangle(points[1],  points[9],  points[8],  "#6666cc"));
    triangles.add(new Triangle(points[1],  points[2],  points[9],  "#6666cc"));
    triangles.add(new Triangle(points[2],  points[4],  points[9],  "#6666cc"));
    triangles.add(new Triangle(points[2],  points[3],  points[4],  "#6666cc"));
    triangles.add(new Triangle(points[4],  points[5],  points[9],  "#6666cc"));
    triangles.add(new Triangle(points[9],  points[5],  points[10], "#6666cc"));
    triangles.add(new Triangle(points[5],  points[6],  points[7],  "#6666cc"));
    triangles.add(new Triangle(points[5],  points[7],  points[10], "#6666cc"));
    triangles.add(new Triangle(points[0],  points[10], points[7],  "#6666cc"));
    triangles.add(new Triangle(points[0],  points[8],  points[10], "#6666cc"));
    
    triangles.add(new Triangle(points[11], points[19], points[12], "#cc6666"));
    triangles.add(new Triangle(points[12], points[19], points[20], "#cc6666"));
    triangles.add(new Triangle(points[12], points[20], points[13], "#cc6666"));
    triangles.add(new Triangle(points[13], points[20], points[15], "#cc6666"));
    triangles.add(new Triangle(points[13], points[15], points[14], "#cc6666"));
    triangles.add(new Triangle(points[15], points[20], points[16], "#cc6666"));
    triangles.add(new Triangle(points[20], points[21], points[16], "#cc6666"));
    triangles.add(new Triangle(points[16], points[18], points[17], "#cc6666"));
    triangles.add(new Triangle(points[16], points[21], points[18], "#cc6666"));
    triangles.add(new Triangle(points[11], points[18], points[21], "#cc6666"));
    triangles.add(new Triangle(points[11], points[21], points[19], "#cc6666"));
    
    triangles.add(new Triangle(points[0],  points[11], points[1],  "#cccc66"));
    triangles.add(new Triangle(points[11], points[12], points[1],  "#cccc66"));
    triangles.add(new Triangle(points[1],  points[12], points[2],  "#cccc66"));
    triangles.add(new Triangle(points[12], points[13], points[2],  "#cccc66"));
    triangles.add(new Triangle(points[3],  points[2],  points[14], "#cccc66"));
    triangles.add(new Triangle(points[2],  points[13], points[14], "#cccc66"));
    triangles.add(new Triangle(points[4],  points[3],  points[15], "#cccc66"));
    triangles.add(new Triangle(points[3],  points[14], points[15], "#cccc66"));
    triangles.add(new Triangle(points[5],  points[4],  points[16], "#cccc66"));
    triangles.add(new Triangle(points[4],  points[15], points[16], "#cccc66"));
    triangles.add(new Triangle(points[6],  points[5],  points[17], "#cccc66"));
    triangles.add(new Triangle(points[5],  points[16], points[17], "#cccc66"));
    triangles.add(new Triangle(points[7],  points[6],  points[18], "#cccc66"));
    triangles.add(new Triangle(points[6],  points[17], points[18], "#cccc66"));
    triangles.add(new Triangle(points[0],  points[7],  points[11], "#cccc66"));
    triangles.add(new Triangle(points[7],  points[18], points[11], "#cccc66"));
    triangles.add(new Triangle(points[8],  points[9],  points[19], "#cccc66"));
    triangles.add(new Triangle(points[9],  points[20], points[19], "#cccc66"));
    triangles.add(new Triangle(points[9],  points[10], points[20], "#cccc66"));
    triangles.add(new Triangle(points[10], points[21], points[20], "#cccc66"));
    triangles.add(new Triangle(points[10], points[8],  points[21], "#cccc66"));
    triangles.add(new Triangle(points[8],  points[19], points[21], "#cccc66"));

    move (point) {
      point.rotateX(angleX);
      point.rotateY(angleY);
    }
    
    depth (a, b) {
      return (b.getDepth() - a.getDepth());
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
      triangles.sort(depth);
      triangles.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new extrudedadepth().run();
}
