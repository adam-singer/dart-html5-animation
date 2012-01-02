#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball.dart');
#source('../classes/bound.dart');

class velocity3d {

  velocity3d() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ball = new Ball();
    var xpos = 0,
        ypos = 0,
        zpos = 0,
        vx = 0,
        vy = 0,
        vz = 0,
        friction = 0.98,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2;
    
    window.on.keyDown.add((KeyboardEvent event) {
      switch (event.keyCode) {
      case 38:        //up
        vy -= 1;
        break;
      case 40:        //down
        vy += 1;
        break;
      case 37:        //left
        vx -= 1;
        break;
      case 39:        //right
        vx += 1;
        break;
      case 16:        //shift
        vz += 1;
        break;
      case 17:        //control
        vz -= 1;
        break;
      }
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      xpos += vx;
      ypos += vy;
      zpos += vz;
      vx *= friction;
      vy *= friction;
      vz *= friction;
      
      if (zpos > -fl) {
        var scale = fl / (fl + zpos);
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
    };
    drawFrame(0);
  }
}

void main() {
  new velocity3d().run();
}
