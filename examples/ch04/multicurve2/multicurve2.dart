#import('dart:html');
#source('point.dart');

class multicurve2 {

  multicurve2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<point> points = new List<point>();
    var numPoints = 9;
    point ctrlPoint = new point(0,0);
    
    for (var i = 0; i < numPoints; i++) {
      point p = new point(
        Math.random() * canvas.width,
        Math.random() * canvas.height);
      points.add(p);
    }
    
    //move to the first point
    context.beginPath();
    context.moveTo(points[0].x, points[1].y);
    //curve through the rest, stopping at each midpoint
    var i=1;
    for (; i < numPoints - 2; i++) {
      ctrlPoint.x = (points[i].x + points[i+1].x) / 2;
      ctrlPoint.y = (points[i].y + points[i+1].y) / 2;
      context.quadraticCurveTo(points[i].x, points[i].y,
                               ctrlPoint.x, ctrlPoint.y);
    }
    //curve through the last two points
    context.quadraticCurveTo(points[i].x, points[i].y,
                             points[i+1].x, points[i+1].y);
    context.stroke();
  }


}

void main() {
  new multicurve2().run();
}
