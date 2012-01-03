#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class timer1 {

  timer1() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball(),
        fps = 30;
    
    ball.y = canvas.height / 2;
    ball.vx = 5;

    drawFrame () {
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      ball.x += ball.vx;
      ball.draw(context);
    }
    
    window.setInterval(drawFrame, (1000/fps).toInt());
  }
}

void main() {
  new timer1().run();
}
