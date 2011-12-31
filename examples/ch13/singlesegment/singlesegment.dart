#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/slider.dart');
#source('../classes/point.dart');
#source('../classes/bound.dart');

class singlesegment {

  singlesegment() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var segment = new Segment(100, 20);
    var slider = new Slider(-90, 90, 0);
    
    segment.x = 100;
    segment.y = 100;

    slider.x = 300;
    slider.y = 20;
    slider.captureMouse(canvas);
    
    drawFrame () {
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      segment.rotation = slider.value * Math.PI / 180;
      segment.draw(context);
      slider.draw(context);
    }
    
    slider.onchange = drawFrame;
    drawFrame();
  }
}

void main() {
  new singlesegment().run();
}
