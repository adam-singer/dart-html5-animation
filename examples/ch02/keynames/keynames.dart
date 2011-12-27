#import('dart:html');

#import('../../include/utilslib.dart', prefix:'utilslib');

class keynames {

  keynames() {
  }

  void run() {
    
    onKeyboardEvent(KeyboardEvent e) {
      switch(e.keyCode) {
       
      case utilslib.Keycode.UP:
        print('up!');
        break;
      
      case utilslib.Keycode.DOWN:
        print('down!');
        break;
        
      case utilslib.Keycode.LEFT:
        print('left!');
        break;
        
      case utilslib.Keycode.RIGHT:
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
  new keynames().run();
}
