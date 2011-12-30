class Ball {
  num x;
  num y;
  num vx;
  num vy;
  num radius;
  num rotation;
  num scaleX;
  num scaleY;
  String color;
  num lineWidth;
  String id;
  
  _defaultValues() {
    this.x=0;
    this.y=0;
    this.rotation=0.0;
    this.scaleX=1;
    this.scaleY=1;
    this.lineWidth=1;
    this.vx=0;
    this.vy=0;
    this.id='';
  }
  
  Ball() {
    this.radius=40;
    this.color='#ff0000';
    _defaultValues();
  }
  
  Ball.withRadius(this.radius) {
    this.color='#ff0000';
    _defaultValues();
  }
  
  Ball.withRadiusAndColor(this.radius,this.color) {
    _defaultValues();
  }
  
  void draw(var context) {
    // CanvasRenderingContext2D
    context.save();
    context.translate(x, y);
    context.rotate(rotation);
    context.scale(scaleX,scaleY);
    
    context.lineWidth = lineWidth;
    context.fillStyle = color;
    context.beginPath();
    //x, y, radius, start_angle, end_angle, anti-clockwise
    context.arc(0, 0, radius, 0, (Math.PI * 2), true);
    context.closePath();
    context.fill();
    if (lineWidth > 0) {
      context.stroke();
    }
    context.restore();
  }
  
  localBound getBounds() {
    return new localBound(
    this.x - this.radius, 
    this.y - this.radius,
    this.radius * 2,
    this.radius * 2);  
  }
}
