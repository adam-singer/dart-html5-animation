#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/slider.dart');
#source('../classes/point.dart');
#source('../classes/bound.dart');

class segment {

  segment() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var segment0 = new Segment(100, 20),
    segment1 = new Segment(200, 10),
    segment2 = new Segment(80, 40);
    
    
    segment0.x = 100;
    segment0.y = 50;
    segment0.draw(context);

    segment1.x = 100;
    segment1.y = 80;
    segment1.draw(context);

    segment2.x = 100;
    segment2.y = 120;
    segment2.draw(context);
  }
}

void main() {
  new segment().run();
}
