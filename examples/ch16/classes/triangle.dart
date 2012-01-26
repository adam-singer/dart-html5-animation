class Triangle {
  Point3d pointA;
  Point3d pointB;
  Point3d pointC;
  String color;
  num lineWidth;
  num alpha;
  Triangle(this.pointA, this.pointB, this.pointC, this.color) {
    this.lineWidth = 1;
    this.alpha = 0.5;
  }
  
  draw(var context) {
    context.save();
    context.lineWidth = this.lineWidth;
    context.fillStyle = context.strokeStyle = utilslib.Utils.colorToRGB(this.color, this.alpha);
    context.beginPath();
    context.moveTo(this.pointA.getScreenX(), this.pointA.getScreenY());
    context.lineTo(this.pointB.getScreenX(), this.pointB.getScreenY());
    context.lineTo(this.pointC.getScreenX(), this.pointC.getScreenY());
    context.closePath();
    context.fill();
    if (this.lineWidth > 0) {
      context.stroke();
    }
    context.restore();
  }
}
