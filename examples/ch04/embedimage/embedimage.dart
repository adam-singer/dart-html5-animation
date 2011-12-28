#import('dart:html');

class embedimage {

  embedimage() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var image = document.query('#picture');
    context.drawImage(image, 0, 0);
  }
}

void main() {
  new embedimage().run();
}
