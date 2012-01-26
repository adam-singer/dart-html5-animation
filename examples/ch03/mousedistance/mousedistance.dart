#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

#source('rectLocal.dart');

class mousedistance {

  mousedistance() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var log = document.query('#log');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var x = canvas.width / 2; 
    var y = canvas.height / 2;
    var rect = new rectLocal(x,y);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0,0,canvas.width,canvas.height);
   
      var dx = rect.x - mouse.x;
      var dy = rect.y - mouse.y;
      var dist = Math.sqrt(dx * dx + dy * dy);
    
      //draw square
      context.fillStyle = "#000000";
      context.fillRect(rect.x - 2, rect.y - 2, 4, 4);
      //draw line
      context.beginPath();
      context.moveTo(rect.x, rect.y);
      context.lineTo(mouse.x, mouse.y);
      context.closePath();
      context.stroke();
      
      //log output of distance value to screen
      log.value = "distance: " + dist;
    };
    
    drawFrame(0);
  }
}

void main() {
  new mousedistance().run();
}
