#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');

class twosegmentreach {

  twosegmentreach() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var segment0 = new Segment(100, 20),
        segment1 = new Segment(100, 20);
    
    segment1.x = canvas.width / 2;
    segment1.y = canvas.height / 2;
    
    reach (segment, xpos, ypos) {
      var dx = xpos - segment.x,
          dy = ypos - segment.y;
      segment.rotation = Math.atan2(dy, dx);
      var w = segment.getPin().x - segment.x,
          h = segment.getPin().y - segment.y;
      return new point(xpos-w,ypos-h);
    }
    
    position (segmentA, segmentB) {
      segmentA.x = segmentB.getPin().x;
      segmentA.y = segmentB.getPin().y;
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var target = reach(segment0, mouse.x, mouse.y);
      reach(segment1, target.x, target.y);
      position(segment0, segment1);
      
      segment0.draw(context);
      segment1.draw(context);
    };
    drawFrame(0);
  }
}

void main() {
  new twosegmentreach().run();
}
