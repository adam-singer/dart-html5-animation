#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ship.dart');
class shipsim {

  shipsim() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var ship = new Ship();
    var vr = 0,
        vx = 0,
        vy = 0,
        thrust = 0;
    
    ship.x = canvas.width / 2;
    ship.y = canvas.height / 2;
    
    window.on.keyDown.add((KeyboardEvent event) {
      switch (event.keyCode) {
      case 37:      //left
        vr = -3;
        break;
      case 39:      //right
        vr = 3;
        break;
      case 38:      //up
        thrust = 0.05;
        ship.showFlame = true;
        break;
      }
    }, false);
    
    window.on.keyUp.add((KeyboardEvent event) {
      vr = 0;
      thrust = 0;
      ship.showFlame = false;
    }, false);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);
      
      ship.rotation += vr * Math.PI / 180;
      var angle = ship.rotation, //in radians
          ax = Math.cos(angle) * thrust,
          ay = Math.sin(angle) * thrust;

      vx += ax;
      vy += ay;
      ship.x += vx;
      ship.y += vy;
      ship.draw(context);
    };
    
    drawFrame(0);
  }
}

void main() {
  new shipsim().run();
}
