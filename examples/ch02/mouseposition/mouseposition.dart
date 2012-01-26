#import('dart:html');

#import('../../include/utilslib.dart', prefix:'utilslib');
class mouseposition {

  mouseposition() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var mouse = utilslib.Utils.captureMouse(canvas);

    canvas.on.mouseDown.add((MouseEvent e) {
      print('x: ${mouse.x}, y: ${mouse.y} ');
    }, false);
  }
}

void main() {
  new mouseposition().run();
}
