#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');

class pixelmove {

  pixelmove() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var log = document.query('#log');
    var mouse = utilslib.Utils.captureMouse(canvas);
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      
      //draw some stripes: red, green, and blue
      for (var i = 0; i < canvas.width; i += 10) {
        for (var j = 0; j < canvas.height; j += 10) {
          context.fillStyle = (i % 20 === 0) ? "#f00" : ((i % 30 === 0) ? "#0f0" : "#00f");
          context.fillRect(i, j, 10, 10);
        }
      }
      
      var imagedata = context.getImageData(0, 0, canvas.width, canvas.height),
      pixels = imagedata.data;
      
      //pixel iteration
      for (var y = 0; y < imagedata.height; y += 1) {
        for (var x = 0; x < imagedata.width; x += 1) {

          var dx = x - mouse.x,
              dy = y - mouse.y,
              dist = Math.sqrt(dx * dx + dy * dy),
              offset = (x + y * imagedata.width) * 4,
              r = pixels[offset],
              g = pixels[offset + 1],
              b = pixels[offset + 2];

          pixels[offset]     = Math.cos(r * dist * 0.001) * 256;
          pixels[offset + 1] = Math.sin(g * dist * 0.001) * 256;
          pixels[offset + 2] = Math.cos(b * dist * 0.0005) * 256;
        }
      }
      
      context.putImageData(imagedata, 0, 0);
    };
    
    drawFrame(0);
  }


}

void main() {
  new pixelmove().run();
}
