#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/tree.dart');

class trees2 {

  trees2() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var trees = [],
        numTrees = 100,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        floor = 50,
        ax = 0,
        ay = 0,
        az = 0,
        vx = 0,
        vy = 0,
        vz = 0,
        gravity = 0.3,
        friction = 0.95;
    
    for (var tree, i = 0; i < numTrees; i++) {
      tree = new Tree();
      tree.xpos = Math.random() * 2000 - 1000;
      tree.ypos = floor;
      tree.zpos = Math.random() * 10000;
      trees.add(tree);
    }
    
    window.on.keyDown.add( (KeyboardEvent event) {
      switch (event.keyCode) {
      case 38:        //up
        az = -1;
        break;
      case 40:        //down
        az = 1;
        break;
      case 37:        //left
        ax = 1;
        break;
      case 39:        //right
        ax = -1;
        break;
      case 32:        //space
        ay = 1;
        break;
      }
    }, false);
    
    window.on.keyUp.add((KeyboardEvent event) {
      switch (event.keyCode) {
      case 38:        //up
      case 40:        //down
        az = 0;
        break;
      case 37:        //left
      case 39:        //right
        ax = 0;
        break;
      case 32:        //space
        ay = 0;
        break;
      }
    }, false);
    
    move (tree) {
      tree.xpos += vx;
      tree.ypos += vy;
      tree.zpos += vz;

      if (tree.ypos < floor) {
        tree.ypos = floor;
      }
      if (tree.zpos < -fl) {
        tree.zpos += 10000;
      }
      if (tree.zpos > 10000 - fl) {
        tree.zpos -= 10000;
      }
      var scale = fl / (fl + tree.zpos);
      tree.scaleX = tree.scaleY = scale;
      tree.x = vpX + tree.xpos * scale;
      tree.y = vpY + tree.ypos * scale;
      tree.alpha = scale;
    }

    zSort (a, b) {
      return (b.zpos - a.zpos);
    }
    
    draw (tree) {
      tree.draw(context);
    }
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      vx += ax;
      vy += ay;
      vz += az;
      vy -= gravity;
      trees.forEach(move);
      vx *= friction;
      vy *= friction;
      vz *= friction;
      trees.sort(zSort);
      trees.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new trees2().run();
}
