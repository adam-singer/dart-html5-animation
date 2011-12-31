class Utils {
  static intersects(var rectA, var rectB) {
    return !(
        rectA.x + rectA.width < rectB.x ||
        rectB.x + rectB.width < rectA.x ||
        rectA.y + rectA.height < rectB.y ||
        rectB.y + rectB.height < rectA.y);
  }
  
  static containsPoint(var rect, var x, var y) {
    return !(
        x < rect.x ||
        x > rect.x + rect.width ||
        y < rect.y ||
        y > rect.y + rect.height);
  }
  
  static colorToRGB(var color, var alpha) {
    int i=0;
    if (color is String && color.startsWith('#')) {
      i = Math.parseInt("0x"+color.substring(1));
    } else {
      i = color;
    }
    
    if (alpha == null) {
      alpha = 1;
    }
    
    //parse hex values
    var r = i >> 16 & 0xff,
        g = i >> 8 & 0xff,
        b = i & 0xff,
        a = (alpha < 0) ? 0 : ((alpha > 1) ? 1 : alpha);
        
    //only use 'rgba' if needed
    if (a === 1) {
      return "rgb("+ r +","+ g +","+ b +")";
    } else {
      return "rgba("+ r +","+ g +","+ b +","+ a +")";
    }
  }
  
  static parseColor(var color, var toNumber) {
    if (toNumber === true) {
      if (color is num) {
        return (color | 0); // chop off decimal
      }
      
     
      if (color is String && color.startsWith('#')) {
        String s = color;
        s = s.substring(1);
        int i = Math.parseInt(s);
        return i;
      }
      
  
    } else {
      if (color is num) {
        
        int r;
        int g;
        int b;
        r = (color&0xff0000)>>16;
        g = (color&0x00ff00)>>8;
        b = color&0x0000ff;
        
        /*
        int i = 0x112233;
        print(i.toRadixString(16));
        print(((i&0xff0000)>>16).toRadixString(16));
        print(((i&0x00ff00)>>8).toRadixString(16));
        print((i&0x0000ff).toRadixString(16));
        */
        return '#' + r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16);
      }
    }
  }
  
  /*
  static touch captureTouch(var element) {
    var _touch = new touch(0,0,false,null);
    
    element.on.touchStart.add((TouchEvent event) {
      _touch.isPressed = true;
      _touch.event = event;
    }, false);
    
    element.on.touchEnd.add((TouchEvent event) {
      _touch.isPressed = false;
      _touch.x = null;
      _touch.y = null;
      _touch.event = event;
    }, false);
    
    element.on.touchMove.add((TouchEvent event) {
      var touch_event = event.targetTouches[0];
      var x,y;
      
      if (touch_event.pageX || touch_event.pageY) {
        x = touch_event.pageX;
        y = touch_event.pageY;
      } else {
        x = touch_event.clientX + body_scrollLeft + element_scrollLeft;
        y = touch_event.clientY + body_scrollTop + element_scrollTop;
      }
      x -= offsetLeft;
      y -= offsetTop;
      
      _touch.x = x;
      _touch.y = y;
      _touch.event = event;
    }, false);
    
    return _touch;
  }
  */
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

