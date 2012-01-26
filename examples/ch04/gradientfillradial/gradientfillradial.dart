#import('dart:html');
#source('../classes/point.dart');
class gradientfillradial {

  gradientfillradial() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var c1 = new point.withRadius(150, 150, 0); //gradient start circle
    var c2 = new point.withRadius(150,150,50);  //gradient end circle
    var gradient = context.createRadialGradient(c1.x, c1.y, c1.radius, c2.x, c2.y, c2.radius);
    //all black alpha blend
    gradient.addColorStop(0, "#000000");
    gradient.addColorStop(1, "rgba(0, 0, 0, 0)"); //alpha required

    context.fillStyle = gradient;
    context.fillRect(100, 100, 100, 100);
  }
}

void main() {
  new gradientfillradial().run();
}
