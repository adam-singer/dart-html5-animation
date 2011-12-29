#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/arrow.dart');

class followmouse1 {

  followmouse1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var arrow = new Arrow();
    var speed = 3;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var dx = mouse.x - arrow.x,
      dy = mouse.y - arrow.y,
      angle = Math.atan2(dy, dx),
      vx = Math.cos(angle) * speed,
      vy = Math.sin(angle) * speed;
      
      arrow.rotation = angle; //radians
      arrow.x += vx;
      arrow.y += vy;
      arrow.draw(context);
    };
    
    drawFrame(0);
  }


}

void main() {
  new followmouse1().run();
}
