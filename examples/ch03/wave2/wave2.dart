#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');


class wave2 {

  wave2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    
    var angle = 0;
    var range = 50;
    var centerY = canvas.height / 2;
    var xspeed = 1;
    var yspeed = 0.05;
    var xpos = 0;
    var ypos = centerY;
     
    context.lineWidth = 2;

    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.beginPath();
      context.moveTo(xpos, ypos);
      //Calculate the new position.
      xpos += xspeed;
      angle += yspeed;
      ypos = centerY + Math.sin(angle) * range;
      context.lineTo(xpos, ypos);
      context.stroke();
    };
    
    drawFrame(0);     
  }


}

void main() {
  new wave2().run();
}
