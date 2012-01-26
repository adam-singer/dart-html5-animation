#import('dart:html');
#source('point.dart');

class multicurve1 {

  multicurve1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<point> points = new List<point>();
    var numPoints = 9;
    
    for (var i = 0; i < numPoints; i++) {
      point p = new point(
        Math.random() * canvas.width,
        Math.random() * canvas.height);
      points.add(p);
    }
    
    //move to the first point
    context.beginPath();
    context.moveTo(points[0].x, points[1].y);
    //and loop through each successive pair
    for (var i = 1; i < numPoints; i += 2) {
      context.quadraticCurveTo(points[i].x, points[i].y,
                               points[i+1].x, points[i+1].y);
    }
    context.stroke();
  }


}

void main() {
  new multicurve1().run();
}
