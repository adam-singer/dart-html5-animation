#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/point3d.dart');
#source('../classes/triangle.dart');

class cylinder {

  cylinder() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var points = [],
        triangles = [],
        numFaces = 20,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleX = 0, 
        angleY = 0;
   
    for (var angle, xpos, ypos, i = 0, idx = 0; i < numFaces; i++) {              
      angle = Math.PI * 2 / numFaces * i;
      xpos = Math.cos(angle) * 200;
      ypos = Math.sin(angle) * 200;
      points.add(new Point3d(xpos, ypos, -100));
      points.add(new Point3d(xpos, ypos,  100));
      idx += 2;
    }
    points.forEach((var point) {
      point.setVanishingPoint(vpX, vpY);
      point.setCenter(0, 0, 200);
    });
    
    var i=0,idx=0;
    for (; i < numFaces - 1; i++) {
      triangles.add(new Triangle(points[idx], points[idx+3], points[idx+1], "#6666cc"));
      triangles.add(new Triangle(points[idx], points[idx+2], points[idx+3], "#6666cc"));
      idx += 2;
    }
    
    triangles.add(new Triangle(points[idx], points[1], points[idx+1], "#6666cc"));
    triangles.add(new Triangle(points[idx], points[0], points[1], "#6666cc"));

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
  new cylinder().run();
}
