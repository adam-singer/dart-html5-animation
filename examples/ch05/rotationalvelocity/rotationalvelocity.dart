#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/arrow.dart');

class rotationalvelocity {

  rotationalvelocity() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var arrow = new Arrow();
    var vr = 2; //degrees
    
    arrow.x = canvas.width / 2;
    arrow.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      arrow.rotation += vr  * Math.PI / 180; //to radians
      arrow.draw(context);
    };
    
    drawFrame(0);
  }


}

void main() {
  new rotationalvelocity().run();
}
