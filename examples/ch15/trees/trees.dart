#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/tree.dart');
class trees {

  trees() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var _trees = [],
        numTrees = 100,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        floor = 200,
        vz = 0,
        friction = 0.98;
    
    for (var tree, i = 0; i < numTrees; i++) {
      tree = new Tree();
      tree.xpos = Math.random() * 2000 - 1000;
      tree.ypos = floor;
      tree.zpos = Math.random() * 10000;
      _trees.add(tree);
    }
    
    window.on.keyDown.add( (KeyboardEvent event) {
      if (event.keyCode === 38) {         //up
        vz -= 1;
      } else if (event.keyCode === 40) {  //down
        vz += 1;
      }
    }, false);
    
    move (tree) {
      tree.zpos += vz;
      
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

      _trees.forEach(move);
      vz *= friction;
      _trees.sort(zSort);
      _trees.forEach(draw);
    }
    drawFrame(0);
  }
}

void main() {
  new trees().run();
}
