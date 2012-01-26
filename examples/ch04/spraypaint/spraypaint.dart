#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

class spraypaint {

  spraypaint() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var log = document.query('#log');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var imagedata = context.getImageData(0, 0, canvas.width, canvas.height);
    var pixels = imagedata.data;
    var brush_size = 25;
    var brush_density = 50;
    var brush_color;
    
    onMouseMove(MouseEvent e) {
      //loop over each brush bristle
      for (var i = 0; i < brush_density; i++) {
        var angle = Math.random() * Math.PI * 2,
            radius = Math.random() * brush_size,
            xpos = (mouse.x + Math.cos(angle) * radius) | 0,
            ypos = (mouse.y + Math.sin(angle) * radius) | 0,
            offset = (xpos + ypos * imagedata.width) * 4; //array index of canvas coordinate

        //set the color of a pixel using its component colors: r,g,b,a (0-255)
        pixels[offset]     = brush_color >> 16 & 0xff; //red
        pixels[offset + 1] = brush_color >> 8 & 0xff;  //green
        pixels[offset + 2] = brush_color & 0xff;       //blue
        pixels[offset + 3] = 255;                      //alpha
      }
      
      context.putImageData(imagedata, 0, 0);
    };
    
    canvas.on.mouseDown.add((MouseEvent e) {
      brush_color = utilslib.Utils.parseColor(Math.random() * 0xffffff, true); //to number
      canvas.on.mouseMove.add(onMouseMove, false);
    }, false);
    
    canvas.on.mouseUp.add((MouseEvent e) {
      
      canvas.on.mouseMove.remove(onMouseMove, false);
    }, false);
  }
}

void main() {
  new spraypaint().run();
}
