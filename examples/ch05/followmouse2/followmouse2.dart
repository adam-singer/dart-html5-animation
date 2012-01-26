#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/arrow.dart');
class followmouse2 {

  followmouse2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var arrow = new Arrow();
    var vx = 0;
    var vy = 0;
    var force = 0.05;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var dx = mouse.x - arrow.x,
      dy = mouse.y - arrow.y,
      angle = Math.atan2(dy, dx),
      ax = Math.cos(angle) * force,
      ay = Math.sin(angle) * force;
      
      arrow.rotation = angle;
      vx += ax;
      vy += ay;
      arrow.x += vx;
      arrow.y += vy;
      arrow.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new followmouse2().run();
}
