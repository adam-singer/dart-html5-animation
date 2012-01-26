#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('rectLocal.dart');


class distance1 {

  distance1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var log = document.query('#log');
    
    //Create a black square, assign random position.
    var rect1 = new rectLocal(        
      Math.random() * canvas.width,
      Math.random() * canvas.height);
    
    context.fillStyle = "#000000";
    context.fillRect(rect1.x - 2, rect1.y - 2, 4, 4);

    //Create a red square, assign random position.
    var rect2 = new rectLocal(        
      Math.random() * canvas.width,
      Math.random() * canvas.height);
    
    context.fillStyle = "#ff0000";
    context.fillRect(rect2.x - 2, rect2.y - 2, 4, 4);

    //Calculate the distance between the two squares.
    var dx = rect1.x - rect2.x;
    var dy = rect1.y - rect2.y;
    var dist = Math.sqrt(dx * dx + dy * dy);
    
    //log output of distance value to screen
    log.value = "distance: " + dist;
    
  }


}

void main() {
  new distance1().run();
}
