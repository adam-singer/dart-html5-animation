class Line {
  num x;
  num y;
  num x1;
  num y1;
  num x2;
  num y2;
  num rotation;
  num scaleX;
  num scaleY;
  num lineWidth;

  _defaultValues() {
    this.x = 0;
    this.y = 0;
    this.rotation = 0;
    this.scaleX = 1;
    this.scaleY = 1;
    this.lineWidth = 1;
  }
  
  Line() {
    _defaultValues();
    this.x1 = 0;
    this.y1 = 0;
    this.x2 = 0;
    this.y2 = 0;
  }
  
  Line.withParameters(this.x1, this.y1, this.x2, this.y2) {
    _defaultValues();
  }
  
  draw(var context) {
    context.save();
    context.translate(this.x, this.y);
    context.rotate(this.rotation);
    context.scale(this.scaleX, this.scaleY);
    
    context.lineWidth = this.lineWidth;
    context.beginPath();
    context.moveTo(this.x1, this.y1);
    context.lineTo(this.x2, this.y2);
    context.closePath();
    context.stroke();
    context.restore();
  }
  
  getBounds() {
    if (this.rotation === 0) {
      var minX = Math.min(this.x1, this.x2),
          minY = Math.min(this.y1, this.y2),
          maxX = Math.max(this.x1, this.x2),
          maxY = Math.max(this.y1, this.y2);
      return new localBound(
        this.x + minX,
        this.y + minY,
        maxX - minX,
        maxY - minY
      );
    } else {
      var sin = Math.sin(this.rotation),
          cos = Math.cos(this.rotation),
          x1r = cos * this.x1 + sin * this.y1,
          x2r = cos * this.x2 + sin * this.y2,
          y1r = cos * this.y1 + sin * this.x1,
          y2r = cos * this.y2 + sin * this.x2;
      return new localBound(
        this.x + Math.min(x1r, x2r),
        this.y + Math.min(y1r, y2r),
        Math.max(x1r, x2r) - Math.min(x1r, x2r),
        Math.max(y1r, y2r) - Math.min(y1r, y2r)
      );
    }
  }
}
