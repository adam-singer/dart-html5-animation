#import('dart:html');
#source('../classes/point.dart');
class gradientfill2 {

  gradientfill2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    point pt1 = new point(100,100); //gradient start point
    point pt2 = new point(200,200); //gradient end point
    CanvasGradient gradient = context.createLinearGradient(pt1.x, pt1.y, pt2.x, pt2.y);
    
    //white to blue to red
    gradient.addColorStop(0, "#ffffff");
    gradient.addColorStop(0.5, "#0000ff");
    gradient.addColorStop(1, "#ff0000");

    context.fillStyle = gradient;
    context.fillRect(100, 100, 100, 100);
  }
}

void main() {
  new gradientfill2().run();
}
