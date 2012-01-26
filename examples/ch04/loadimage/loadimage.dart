#import('dart:html');

class loadimage {

  loadimage() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    ImageElement image = new Element.tag("img");
    image.src = '../assets/picture.jpg';
    image.on.load.add((Event e) { 
      context.drawImage(image, 0, 0);
    }, false);
  }
}

void main() {
  new loadimage().run();
}
