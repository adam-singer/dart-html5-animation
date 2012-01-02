#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class perspective2 {

  perspective2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var ball = new Ball();
    var xpos = 0,
        ypos = 0,
        zpos = 0,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2;
    
    window.on.keyDown.add((KeyboardEvent event) {
      if (event.keyCode == 38) {
        zpos += 5;
      } else if (event.keyCode == 40) {
        zpos -= 5;
      }      
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      if (zpos > -fl) {
        var scale = fl / (fl + zpos);
        xpos = mouse.x - vpX;
        ypos = mouse.y - vpY;
        ball.scaleX = ball.scaleY = scale;
        ball.x = vpX + xpos * scale;
        ball.y = vpY + ypos * scale;
        ball.visible = true;
      } else {
        ball.visible = false;
      }
      if (ball.visible) {
        ball.draw(context);
      }
    }
    drawFrame(0);
  }
}

void main() {
  new perspective2().run();
}
