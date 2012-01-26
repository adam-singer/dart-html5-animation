#import('dart:html');
#source('point.dart');

class multicurve3 {

  multicurve3() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<point> points = new List<point>();
    var numPoints = 9;
    point ctrlPoint = new point(0,0);
    point ctrlPoint1 = new point(0,0);
    
    for (var i = 0; i < numPoints; i++) {
      points.add(new point(
        Math.random() * canvas.width,
        Math.random() * canvas.height));
    }
    
    //find the first midpoint and move to it
    ctrlPoint1.x = (points[0].x + points[numPoints-1].x) / 2;
    ctrlPoint1.y = (points[0].y + points[numPoints-1].y) / 2;
    context.beginPath();
    context.moveTo(ctrlPoint1.x, ctrlPoint1.y);

    //curve through the rest, stopping at each midpoint
    var i;
    for (i = 0; i < numPoints - 1; i++) {
      ctrlPoint.x = (points[i].x + points[i+1].x) / 2;
      ctrlPoint.y = (points[i].y + points[i+1].y) / 2;
      context.quadraticCurveTo(points[i].x, points[i].y,
                               ctrlPoint.x, ctrlPoint.y);
    }
    //curve through the last point, back to the first midpoint
    context.quadraticCurveTo(points[i].x, points[i].y,
                             ctrlPoint1.x, ctrlPoint1.y);
    context.stroke();
  }


}

void main() {
  new multicurve3().run();
}
