class Slider {
  num min;
  num max;
  num value;
  Function onchange;

  num x;
  num y;
  num width;
  num height;

  String backColor;
  String backBorderColor;
  num backWidth;
  num backX;
  
  String handleColor;
  String handleBorderColor;
  num handleHeight;
  num handleY;
  
  Slider(this.min, this.max, this.value) {
    this.onchange = null;

    this.x = 0;
    this.y = 0;
    this.width = 16;
    this.height = 100;

    this.backColor = "#cccccc";
    this.backBorderColor = "#999999";
    this.backWidth = 4;
    this.backX = this.width / 2 - this.backWidth / 2;
    
    this.handleColor = "#eeeeee";
    this.handleBorderColor = "#cccccc";
    this.handleHeight = 6;
    this.handleY = 0;

    this.updatePosition();
  }
  
  draw(var context) {
    context.save();
    context.translate(this.x, this.y);

    //draw back
    context.fillStyle = this.backColor;
    context.beginPath();
    context.fillRect(this.backX, 0, this.backWidth, this.height);
    context.closePath();
    
    //draw handle
    context.strokeStyle = this.handleBorderColor;
    context.fillStyle = this.handleColor;
    context.beginPath();
    context.rect(0, this.handleY, this.width, this.handleHeight);
    context.closePath();
    context.fill();
    context.stroke();

    context.restore();
  }
  
  updateValue() {
    var old_value = this.value,
    handleRange = this.height - this.handleHeight,
    valueRange = this.max - this.min;

    this.value = (handleRange - this.handleY) / handleRange * valueRange + this.min;
    if (this.onchange is Function) {
      this.onchange();
    }
  }
  
  updatePosition() {
    var handleRange = this.height - this.handleHeight,
    valueRange = this.max - this.min;

    this.handleY = handleRange - ((this.value - this.min) / valueRange) * handleRange;
  }
  
  captureMouse(CanvasElement element) {
    var mouse = utilslib.Utils.captureMouse(element);
    
    var bounds = new localBound(
      this.x, 
      this.y + this.handleY,
      this.width,
      this.handleHeight);
    
    onMouseMove(MouseEvent event) {
      var pos_y = mouse.y - this.y;
      this.handleY = Math.min(this.height - this.handleHeight, Math.max(pos_y, 0));
      this.updateValue();
    };
    
    onMouseUp(MouseEvent event) {
      element.on.mouseUp.remove(onMouseUp, false);
      element.on.mouseMove.remove(onMouseMove, false);
    };
    
    element.on.mouseDown.add((MouseEvent event) {
      if (utilslib.Utils.containsPoint(bounds, mouse.x, mouse.y)) {
        element.on.mouseUp.add(onMouseUp, false);
        element.on.mouseMove.add(onMouseMove, false);
      }
    }, false);
  }
}
