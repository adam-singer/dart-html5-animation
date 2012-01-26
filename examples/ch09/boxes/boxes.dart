#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/box.dart');

class boxes {

  boxes() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    List<Box> _boxes = new List<Box>();
    var activeBox; 
    var gravity = 0.2;
    
    createBox () {
      var box = new Box.withSize(Math.random() * 40 + 10, Math.random() * 40 + 10);
      box.x = Math.random() * canvas.width;
      _boxes.add(box);
      return box;
    };
    
    activeBox = createBox();
    
    drawBox(var box) {
      if (activeBox !== box && utilslib.Utils.intersects(activeBox, box)) {
        activeBox.y = box.y - activeBox.height;
        activeBox = createBox();
      }
      box.draw(context);
    };
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      activeBox.vy += gravity;
      activeBox.y += activeBox.vy;

      if (activeBox.y + activeBox.height > canvas.height) {
        activeBox.y = canvas.height - activeBox.height;
        activeBox = createBox();
      }
      _boxes.forEach(drawBox);
    };
    
    drawFrame(0);
  }
}

void main() {
  new boxes().run();
}
