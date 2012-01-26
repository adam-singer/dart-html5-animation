#import('dart:html');

class keycodes {

  keycodes() {
  }

  void run() {
   
    onKeyboardEvent(KeyboardEvent e) {
      switch(e.keyCode) {
       
      case 38:
        print('up!');
        break;
      
      case 40:
        print('down!');
        break;
        
      case 37:
        print('left!');
        break;
        
      case 39:
        print('right!');
        break;
        
      default:
        print('${e.keyCode}');
        break;
      }
    };
    
    document.window.on.keyDown.add(onKeyboardEvent, false);
  }
}

void main() {
  new keycodes().run();
}
