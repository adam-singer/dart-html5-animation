class Ball3d {
  String color;
  num radius;  
  num x;
  num y;
  num xpos;
  num ypos;
  num zpos;  
  num vx;
  num vy;
  num vz;
  num mass;
  num rotation;
  num scaleX;
  num scaleY;
  num lineWidth;
  bool visible;
  
  _defaultValues() {
    this.x = 0;
    this.y = 0;
    this.xpos = 0;
    this.ypos = 0;
    this.zpos = 0;
    this.vx = 0;
    this.vy = 0;
    this.vz = 0;
    this.mass = 1;
    this.rotation = 0;
    this.scaleX = 1;
    this.scaleY = 1;
    this.lineWidth = 1;
    this.visible = true;
  }
  
  Ball3d() {
    this.radius=40;
    this.color='#ff0000';
    _defaultValues();
  }
  
  Ball3d.withRadius(this.radius) {
    this.color='#ff0000';
    _defaultValues();
  }
  
  Ball3d.withRadiusAndColor(this.radius,this.color) {
    _defaultValues();
  }
  
  void draw(var context) {
    context.save();
    context.translate(this.x, this.y);
    context.rotate(this.rotation);
    context.scale(this.scaleX, this.scaleY);
    
    context.lineWidth = this.lineWidth;
    context.fillStyle = this.color;
    context.beginPath();
    //x, y, radius, start_angle, end_angle, anti-clockwise
    context.arc(0, 0, this.radius, 0, (Math.PI * 2), true);
    context.closePath();
    context.fill();
    if (this.lineWidth > 0) {
      context.stroke();
    }
    context.restore();
  }
}
