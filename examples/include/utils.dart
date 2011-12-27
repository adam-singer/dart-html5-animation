class Utils {
  static Mouse captureMouse(var element) {
    Mouse mouse = new Mouse();
    // non of the Element.scroll* is available in htmllib for whatever reason. 
    // we are better off with offsetX/offsetY
    //var body_scrollLeft = 0; // document.body.scrollLeft;
    //var element_scrollLeft = 0; // document.document.scrollLeft;
    //var body_scrollTop = 0; // document.body.scrollTop;
    //var element_scrollTop = 0; // document.document.scrollTop;
    //var offsetLeft = 0; // element.scrollLeft; //element.offsetLeft;
    //var offsetTop = 0; //element.scrollTop; //element.offsetTop;
    
    element.on.mouseMove.add((MouseEvent e) {
      /*
      int x;
      int y;
      
      if (e.pageX  > 0 || e.pageY > 0) {
        x = e.pageX;
        y = e.pageY;
      } else {
        x = e.clientX + body_scrollLeft + element_scrollLeft;
        y = e.clientY + body_scrollTop + element_scrollTop;
      }
      
      x -= offsetLeft;
      y -= offsetTop;
      */
      //print('e.offsetX = ' + e.offsetX);
      //print('e.offsetY = ' + e.offsetY);
      
      mouse.x = e.offsetX;
      mouse.y = e.offsetY;
      mouse.event = e;
    });
    
    return mouse;
  }
}

