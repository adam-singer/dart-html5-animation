#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');

class multisegmentreach {

  multisegmentreach() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var segments = [];
    var numSegments = 5;
    point target;
    
    while (numSegments--) {
      segments.add(new Segment(50, 10));
    }
    
    //center the last one
    segments[segments.length - 1].x = canvas.width / 2;
    segments[segments.length - 1].y = canvas.height / 2;
    
    reach (segment, xpos, ypos) {
      var dx = xpos - segment.x,
          dy = ypos - segment.y;
      segment.rotation = Math.atan2(dy, dx);
      var w = segment.getPin().x - segment.x,
          h = segment.getPin().y - segment.y;
      return new point(xpos - w, ypos - h);
    }
    
    position (segmentA, segmentB) {
      segmentA.x = segmentB.getPin().x;
      segmentA.y = segmentB.getPin().y;
    }
    
    move (segment, i) {
      if (i !== 0) {
        target = reach(segment, target.x, target.y);
        position(segments[i - 1], segment);
      }
    }
    
    draw (segment) {
      segment.draw(context);
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      target = reach(segments[0], mouse.x, mouse.y);
      var i=0;
      segments.forEach((var s) { move(s,i); i++; }); 
      segments.forEach(draw);
    }
    drawFrame(0);
    
  }
}

void main() {
  new multisegmentreach().run();
}
