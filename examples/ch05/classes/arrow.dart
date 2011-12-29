class Arrow {
  int x;
  int y;
  String color;
  double rotation;
  
  Arrow() {
    x=0;
    y=0;
    color="#ffff00";
    rotation=0.0;
  }
  
  void draw(var context) {
    
    context.save();
    context.translate(x, y);
    context.rotate(rotation);
    
    context.lineWidth = 2;
    context.fillStyle = color;
    context.beginPath();
    context.moveTo(-50, -25);
    context.lineTo(0, -25);
    context.lineTo(0, -50);
    context.lineTo(50, 0);
    context.lineTo(0, 50);
    context.lineTo(0, 25);
    context.lineTo(-50, 25);
    context.lineTo(-50, -25);
    context.closePath();
    context.fill();
    context.stroke();
    
    context.restore();
   
  }
}
