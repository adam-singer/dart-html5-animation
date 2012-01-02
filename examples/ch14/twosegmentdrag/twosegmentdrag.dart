#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');

class twosegmentdrag {

  twosegmentdrag() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var segment0 = new Segment(100, 20);
    var segment1 = new Segment(100, 20);
    
    drag (segment, xpos, ypos) {
      var dx = xpos - segment.x,
          dy = ypos - segment.y;
      segment.rotation = Math.atan2(dy, dx);
      var w = segment.getPin().x - segment.x,
          h = segment.getPin().y - segment.y;
      segment.x = xpos - w;
      segment.y = ypos - h;
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      drag(segment0, mouse.x, mouse.y);
      drag(segment1, segment0.x, segment0.y);

      segment0.draw(context);
      segment1.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new twosegmentdrag().run();
}
