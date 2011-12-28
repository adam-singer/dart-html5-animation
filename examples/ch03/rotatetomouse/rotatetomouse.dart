#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/arrow.dart');
class rotatetomouse {

  rotatetomouse() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var context = canvas.getContext('2d');
    var arrow = new Arrow();
    arrow.x = canvas.width / 2;
    arrow.y = canvas.height / 2;
    mouse.x = 0;
    mouse.y = 0;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
      var dx = mouse.x - arrow.x;
      var dy = mouse.y - arrow.y;
      arrow.rotation = Math.atan2(dy,dx);
      arrow.draw(context);
    };
   
    drawFrame(0);
  }

}

void main() {
  new rotatetomouse().run();
}
