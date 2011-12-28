#import('dart:html');

class videoframes {

  videoframes() {
  }

  void run() {
    // NOTE: Sample does not fully work, file bug with dart team
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    VideoElement video = document.query('#movieclip');
    
    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.drawImage(video, 0, 0);
    };
    
    drawFrame(0);
  }
}

void main() {
  new videoframes().run();
}
