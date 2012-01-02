#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');

class cosines1 {

  cosines1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var segment0 = new Segment(100, 20),
        segment1 = new Segment(100, 20);
    
    segment1.x = canvas.width / 2;
    segment1.y = canvas.height / 2; 
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      var dx = mouse.x - segment1.x,
          dy = mouse.y - segment1.y,
          dist = Math.sqrt(dx * dx + dy * dy),
          a = 100,
          b = 100,
          c = Math.min(dist, a + b),
          B = Math.acos((b * b - a * a - c * c) / (-2 * a * c)),
          C = Math.acos((c * c - a * a - b * b) / (-2 * a * b)),
          D = Math.atan2(dy, dx),
          E = D + B + Math.PI + C;
      
      segment1.rotation = (D + B);

      var target = segment1.getPin();
      segment0.x = target.x;
      segment0.y = target.y;
      segment0.rotation = E;
      
      segment0.draw(context);
      segment1.draw(context);
    }
    drawFrame(0);
  }
}

void main() {
  new cosines1().run();
}
