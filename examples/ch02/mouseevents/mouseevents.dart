#import('dart:html');

class mouseevents {

  mouseevents() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    
    onMouseEvent(Event e) {
      print(e.type);
    };
    
    canvas.on.mouseDown.add(onMouseEvent, false);
    canvas.on.mouseUp.add(onMouseEvent, false);
    canvas.on.click.add(onMouseEvent, false);
    canvas.on.dblClick.add(onMouseEvent, false);
    canvas.on.mouseWheel.add(onMouseEvent, false);
    canvas.on.mouseMove.add(onMouseEvent, false);
    canvas.on.mouseOver.add(onMouseEvent, false);
    canvas.on.mouseOut.add(onMouseEvent, false);
  }
}

void main() {
  new mouseevents().run();
}
