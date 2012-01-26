#import('dart:html');

class invertcolor {

  invertcolor() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    
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
    for (var offset = 0, len = pixels.length; offset < len; offset += 4) {
      //invert each color component of the pixel: r,g,b,a (0-255)
      pixels[offset]     = 255 - pixels[offset];     //red to cyan
      pixels[offset + 1] = 255 - pixels[offset + 1]; //green to magenta
      pixels[offset + 2] = 255 - pixels[offset + 2]; //blue to yellow
      //pixels[offset + 4] is alpha (the fourth component)
    }
      
    context.putImageData(imagedata, 0, 0);
  }


}

void main() {
  new invertcolor().run();
}
