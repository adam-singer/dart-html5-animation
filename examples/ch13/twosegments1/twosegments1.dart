#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/slider.dart');
#source('../classes/point.dart');
#source('../classes/bound.dart');

class twosegments1 {

  twosegments1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var segment0 = new Segment(100, 20),
        segment1 = new Segment(100, 20),
        slider0 = new Slider(-90, 90, 0),
        slider1 = new Slider(-90, 90, 0);
    
    drawFrame () {
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      segment0.rotation = slider0.value * Math.PI / 180;
      segment1.rotation = slider1.value * Math.PI / 180;
      segment1.x = segment0.getPin().x;
      segment1.y = segment0.getPin().y;
      segment0.draw(context);
      segment1.draw(context);
      slider0.draw(context);
      slider1.draw(context);
    };
    
    segment0.x = 100;
    segment0.y = 100;

    slider0.x = 320;
    slider0.y = 20;
    slider0.captureMouse(canvas);
    slider0.onchange = drawFrame;

    slider1.x = 340;
    slider1.y = 20;
    slider1.captureMouse(canvas);
    slider1.onchange = drawFrame;

    drawFrame();
  }
}

void main() {
  new twosegments1().run();
}
