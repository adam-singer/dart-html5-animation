#import('dart:html');

class eventdemo {

  eventdemo() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    canvas.on.mouseDown.add((Event e) {
      print('mouse down');
    }, false);
    
    canvas.on.mouseUp.add((Event e) {
      print('mouse up');
    }, false);
  }
}

void main() {
  new eventdemo().run();
}
