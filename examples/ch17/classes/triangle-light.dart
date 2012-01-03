class Triangle {
  Point3d pointA;
  Point3d pointB;
  Point3d pointC;
  String color;
  num lineWidth;
  num alpha;
  Light light;
  Triangle(this.pointA, this.pointB, this.pointC, this.color) {
    this.lineWidth = 1;
    this.alpha = 1;
  }
  
  draw(var context) {
    if (this.isBackface()) {
      return;
    }
    context.save();
    context.lineWidth = this.lineWidth;
    context.fillStyle = this.getAdjustedColor();
    context.strokeStyle = this.getAdjustedColor();
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
  
  getDepth() {
    var m = Math.min(this.pointA.z, this.pointB.z);
    m = Math.min(m,  this.pointC.z);
    return m;
  }
  
  isBackface() {
    var cax = this.pointC.getScreenX() - this.pointA.getScreenX(),
        cay = this.pointC.getScreenY() - this.pointA.getScreenY(),
        bcx = this.pointB.getScreenX() - this.pointC.getScreenX(),
        bcy = this.pointB.getScreenY() - this.pointC.getScreenY();
    return cax * bcy > cay * bcx;
  }
  
  getAdjustedColor() {
    int _color = Math.parseInt("0x"+color.substring(1)),
    //var _color = utilslib.Utils.parseColor(this.color, true),
    red = _color >> 16,
    green = _color >> 8 & 0xff,
    blue = _color & 0xff,
    lightFactor = this.getLightFactor();
    red *= lightFactor;
    green *= lightFactor;
    blue *= lightFactor;
    return utilslib.Utils.parseColor(red << 16 | green << 8 | blue, false);
  }
  
  getLightFactor() {
    var ab = new Light.withParameters(    
      this.pointA.x - this.pointB.x,
      this.pointA.y - this.pointB.y,
      this.pointA.z - this.pointB.z);
    
    var bc = new Light.withParameters(
      this.pointB.x - this.pointC.x,
      this.pointB.y - this.pointC.y,
      this.pointB.z - this.pointC.z);
    
    var norm = new Light.withParameters(
        (ab.y * bc.z) - (ab.z * bc.y),
      -((ab.x * bc.z) - (ab.z * bc.x)),
        (ab.x * bc.y) - (ab.y * bc.x));
    
    var dotProd = norm.x * this.light.x +
        norm.y * this.light.y +
        norm.z * this.light.z;
    
    var normMag = Math.sqrt(norm.x * norm.x +
              norm.y * norm.y +
              norm.z * norm.z);
    var lightMag = Math.sqrt(this.light.x * this.light.x +
               this.light.y * this.light.y +
               this.light.z * this.light.z);
    
    return (Math.acos(dotProd / (normMag * lightMag)) / Math.PI) * this.light.brightness;
  }
}
