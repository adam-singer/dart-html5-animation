#import('dart:html');

class touchevents {

  touchevents() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    onTouchEvent(Event e) {
      print('${e.type}');
    };
    
    canvas.on.touchStart.add(onTouchEvent, false);
    canvas.on.touchEnd.add(onTouchEvent, false);
    canvas.on.touchMove.add(onTouchEvent, false);
  }
}

void main() {
  new touchevents().run();
}
