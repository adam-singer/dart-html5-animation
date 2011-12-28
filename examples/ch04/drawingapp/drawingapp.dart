#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

class drawingapp {

  drawingapp() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    
    onMouseMove(MouseEvent e) {
      context.lineTo(mouse.x, mouse.y);
      context.stroke();
    };
    
    canvas.on.mouseDown.add((MouseEvent e) {
      context.beginPath();
      context.moveTo(mouse.x, mouse.y);
      canvas.on.mouseMove.add(onMouseMove, false);
    }, false);
    
    canvas.on.mouseUp.add(onMouseMove, false);
  }

}

void main() {
  new drawingapp().run();
}
