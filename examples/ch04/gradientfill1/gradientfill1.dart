#import('dart:html');
#source('../classes/point.dart');
class gradientfill1 {

  gradientfill1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    point pt1 = new point(0,0);
    point pt2 = new point(100,100);
    CanvasGradient gradient = context.createLinearGradient(pt1.x, pt1.y, pt2.x, pt2.y);
    
    //white to red
    gradient.addColorStop(0, "#ffffff");
    gradient.addColorStop(1, "#ff0000");
    
    context.fillStyle = gradient;
    context.fillRect(0, 0, 100, 100);
  }
}

void main() {
  new gradientfill1().run();
}
