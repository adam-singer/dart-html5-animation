#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');

class onesegmentdrag {

  onesegmentdrag() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var segment0 = new Segment(100, 20);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var dx = mouse.x - segment0.x,
          dy = mouse.y - segment0.y;
      segment0.rotation = Math.atan2(dy, dx);
      var w = segment0.getPin().x - segment0.x,
          h = segment0.getPin().y - segment0.y;
      segment0.x = mouse.x - w;
      segment0.y = mouse.y - h;
    
      segment0.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new onesegmentdrag().run();
}
