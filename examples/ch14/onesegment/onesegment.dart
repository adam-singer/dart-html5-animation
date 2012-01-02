#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');


class onesegment {

  onesegment() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var segment0 = new Segment(100, 20);
    
    segment0.x = canvas.width / 2;
    segment0.y = canvas.height / 2;
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var dx = mouse.x - segment0.x,
          dy = mouse.y - segment0.y;        
      segment0.rotation = Math.atan2(dy, dx);

      segment0.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new onesegment().run();
}
