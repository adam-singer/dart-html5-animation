#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');
#source('../classes/triangle.dart');

class movecube2 {

  movecube2() {
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
        offsetX = 0,
        offsetY = 0,
        angleX = 0, 
        angleY = 0;
    
    //front four corners
    points.add(new Point3d(-100, -100, -100));
    points.add(new Point3d( 100, -100, -100));
    points.add(new Point3d( 100,  100, -100));
    points.add(new Point3d(-100,  100, -100));
    //back four corners
    points.add(new Point3d(-100, -100, 100));
    points.add(new Point3d( 100, -100, 100));
    points.add(new Point3d( 100,  100, 100));
    points.add(new Point3d(-100,  100, 100));
    
    points.forEach(function (point) {
      point.setVanishingPoint(vpX, vpY);
      point.setCenter(0, 0, 200);
    });

    //front
    triangles.add(new Triangle(points[0], points[1], points[2], "#6666cc"));
    triangles.add(new Triangle(points[0], points[2], points[3], "#6666cc"));
    //top
    triangles.add(new Triangle(points[0], points[5], points[1], "#66cc66"));
    triangles.add(new Triangle(points[0], points[4], points[5], "#66cc66"));
    //back
    triangles.add(new Triangle(points[4], points[6], points[5], "#cc6666"));
    triangles.add(new Triangle(points[4], points[7], points[6], "#cc6666"));
    //bottom
    triangles.add(new Triangle(points[3], points[2], points[6], "#cc66cc"));
    triangles.add(new Triangle(points[3], points[6], points[7], "#cc66cc"));
    //right
    triangles.add(new Triangle(points[1], points[5], points[6], "#66cccc"));
    triangles.add(new Triangle(points[1], points[6], points[2], "#66cccc"));
    //left
    triangles.add(new Triangle(points[4], points[0], points[3], "#cccc66"));
    triangles.add(new Triangle(points[4], points[3], points[7], "#cccc66"));
    
    window.on.keyDown.add((KeyboardEvent event) {
      if (event.keyCode === 37) {         //left
        offsetX -= 5;
      } else if (event.keyCode === 39) {  //right
        offsetX += 5;
      } else if (event.keyCode === 38) {  //up
        offsetY -= 5;
      } else if (event.keyCode === 40) {  //down
        offsetY += 5;
      }
      points.forEach((var point) {
        point.setCenter(offsetX, offsetY, 200);
      });
    }, false);
    
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
  new movecube2().run();
}
