#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/point.dart');
#source('../classes/bound.dart');

class walking4 {

  walking4() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var segment0 = new Segment(100, 30),
        segment1 = new Segment(100, 20),
        segment2 = new Segment(100, 30),
        segment3 = new Segment(100, 20),
        cycle = 0,
        offset = -Math.PI / 2; //should be between PI and -PI
    
    segment0.x = 200;
    segment0.y = 200;
    
    segment1.x = segment0.getPin().x;
    segment1.y = segment0.getPin().y;

    segment2.x = 200;
    segment2.y = 200;
    
    segment3.x = segment2.getPin().x;
    segment3.y = segment2.getPin().y;
    
    walk (var segA, var segB, var cyc) {
      var angle0 = (Math.sin(cyc) * 45 + 90) * Math.PI / 180,
          angle1 = (Math.sin(cyc + offset) * 45 + 45) * Math.PI / 180;

      segA.rotation = angle0;
      segB.rotation = segA.rotation + angle1;
      segB.x = segA.getPin().x;
      segB.y = segA.getPin().y;
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      cycle += 0.02;
      walk(segment0, segment1, cycle);
      walk(segment2, segment3, cycle + Math.PI);
      segment0.draw(context);
      segment1.draw(context);
      segment2.draw(context);
      segment3.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new walking4().run();
}
