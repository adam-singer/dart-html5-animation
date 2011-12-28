#import('dart:html');

class grayscale {

  grayscale() {
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
      var r = pixels[offset],
          g = pixels[offset + 1],
          b = pixels[offset + 2],
          y = (0.2126 * r) + (0.7152 * g) + (0.0722 * b); //relative luminance, humans perceive green more

      pixels[offset] = pixels[offset + 1] = pixels[offset + 2] = y;
    }
    
    context.putImageData(imagedata, 0, 0);
  }
}

void main() {
  new grayscale().run();
}
