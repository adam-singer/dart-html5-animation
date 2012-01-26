class Box {
  num x;
  num y;
  num width;
  num height;
  num vx;
  num vy;
  num rotation;
  num scaleX;
  num scaleY;
  String color;
  num lineWidth;
  
  _defaultValues() {
    this.x = 0;
   
    this.y = 0;
   /// this.width = width;
   // this.height = height;
    this.vx = 0;
    this.vy = 0;
    this.rotation = 0;
    this.scaleX = 1;
    this.scaleY = 1;
    //this.color = utils.parseColor(color);
    this.lineWidth = 1;
  }
  Box() {
    this.width = 10;
    this.height = 10;
    this.color = "#ff0000";
    _defaultValues();
  }
  Box.withSize(this.width,this.height) {
    this.color = "#ff0000";
    _defaultValues();
  }
  Box.withSizeAndColor(this.width,this.height,this.color) {
    _defaultValues();
  }
  
  draw(var context) {
    context.save();
    context.translate(this.x, this.y);
    context.rotate(this.rotation);
    context.scale(this.scaleX, this.scaleY);

    context.lineWidth = this.lineWidth;
    context.fillStyle = this.color;
    context.beginPath();
    context.rect(0, 0, this.width, this.height);
    context.closePath();
    context.fill();
    if (this.lineWidth > 0) {
      context.stroke();
    }
    context.restore();
  }
}
