#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/segment.dart');
#source('../classes/slider.dart');
#source('../classes/point.dart');
#source('../classes/bound.dart');

class walking5 {

  walking5() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var segment0 = new Segment(100, 30),
        segment1 = new Segment(100, 20),
        segment2 = new Segment(100, 30),
        segment3 = new Segment(100, 20),
        speedSlider = new Slider(0, 0.2, 0.08),
        thighRangeSlider = new Slider(0, 90, 45),
        thighBaseSlider = new Slider(0, 180, 90),
        calfRangeSlider = new Slider(0, 90, 45),
        calfOffsetSlider = new Slider(-3.14, 3.14, -1.57),
        cycle = 0;
    
    segment0.x = 200;
    segment0.y = 200;
    
    segment1.x = segment0.getPin().x;
    segment1.y = segment0.getPin().y;

    segment2.x = 200;
    segment2.y = 200;
    
    segment3.x = segment2.getPin().x;
    segment3.y = segment2.getPin().y;

    speedSlider.x = 10;
    speedSlider.y = 10;
    speedSlider.captureMouse(canvas);

    thighRangeSlider.x = 30;
    thighRangeSlider.y = 10;
    thighRangeSlider.captureMouse(canvas);

    thighBaseSlider.x = 50;
    thighBaseSlider.y = 10;
    thighBaseSlider.captureMouse(canvas);

    calfRangeSlider.x = 70;
    calfRangeSlider.y = 10;
    calfRangeSlider.captureMouse(canvas);

    calfOffsetSlider.x = 90;
    calfOffsetSlider.y = 10;
    calfOffsetSlider.captureMouse(canvas);
    
    walk (var segA, var segB, var cyc) {
      var angle0 = (Math.sin(cyc) * thighRangeSlider.value + thighBaseSlider.value) * Math.PI / 180,
          angle1 = (Math.sin(cyc + calfOffsetSlider.value) * calfRangeSlider.value + calfRangeSlider.value) * Math.PI / 180;

      segA.rotation = angle0;
      segB.rotation = segA.rotation + angle1;
      segB.x = segA.getPin().x;
      segB.y = segA.getPin().y;
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      cycle += speedSlider.value;
      walk(segment0, segment1, cycle);
      walk(segment2, segment3, cycle + Math.PI);
      segment0.draw(context);
      segment1.draw(context);
      segment2.draw(context);
      segment3.draw(context);
      speedSlider.draw(context);
      thighRangeSlider.draw(context);
      thighBaseSlider.draw(context);
      calfRangeSlider.draw(context);
      calfOffsetSlider.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new walking5().run();
}
