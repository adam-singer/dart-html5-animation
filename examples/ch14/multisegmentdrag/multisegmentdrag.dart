#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');

class multisegmentdrag {

  multisegmentdrag() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    //List<Segment> segments = new List<Segment>();
    var segments = [];
    var numSegments = 5;
    
    while (numSegments--) {
      segments.add(new Segment(50, 10));
    }
    
    drag (segment, xpos, ypos) {
      var dx = xpos - segment.x,
          dy = ypos - segment.y;
      segment.rotation = Math.atan2(dy, dx);
      var w = segment.getPin().x - segment.x,
          h = segment.getPin().y - segment.y;
      segment.x = xpos - w;
      segment.y = ypos - h;
    }
    
    move (segment, i) {
      if (i !== 0) {
        drag(segment, segments[i-1].x, segments[i-1].y);
      }
    }
    
    draw (segment, i) {
      segment.draw(context);
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      drag(segments[0], mouse.x, mouse.y);
      var i=0;
      segments.forEach((var s) { move(s, i); i++;});
      
      i=0;
      segments.forEach((var d) { draw(d, i); i++;});
    };
    drawFrame(0);
  }
}

void main() {
  new multisegmentdrag().run();
}
