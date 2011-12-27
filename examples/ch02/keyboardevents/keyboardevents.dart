#import('dart:html');

class keyboardevents {

  keyboardevents() {
  }

  void run() {
    
    onKeyboardEvent(Event e) {
      print('${e.type}');
    };

    document.window.on.keyDown.add(onKeyboardEvent, false);
    document.window.on.keyUp.add(onKeyboardEvent, false);
  }
}

void main() {
  new keyboardevents().run();
}
