class Point3d {
  num x;
  num y;
  num z;
  num fl;
  num vpX;
  num vpY;
  num cX;
  num cY;
  num cZ;
  
  Point3d(var x, var y, var z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.fl = 250;
    this.vpX = 0;
    this.vpY = 0;
    this.cX = 0;
    this.cY = 0;
    this.cZ = 0;
  }
  
  setVanishingPoint(var vpX, var vpY) {
    this.vpX = vpX;
    this.vpY = vpY;
  }
  
  setCenter(var cX, var cY, var cZ) {
    this.cX = cX;
    this.cY = cY;
    this.cZ = cZ;
  }

  rotateX(var angleX) {
    var cosX = Math.cos(angleX),
        sinX = Math.sin(angleX),
        y1 = this.y * cosX - this.z * sinX,
        z1 = this.z * cosX + this.y * sinX;
    this.y = y1;
    this.z = z1;
  }
     
  rotateY(var angleY) {
    var cosY = Math.cos(angleY),
        sinY = Math.sin(angleY),
        x1 = this.x * cosY - this.z * sinY,
        z1 = this.z * cosY + this.x * sinY;
    this.x = x1;
    this.z = z1;
  }

  rotateZ(var angleZ) {
    var cosZ = Math.cos(angleZ),
        sinZ = Math.sin(angleZ),
        x1 = this.x * cosZ - this.y * sinZ,
        y1 = this.y * cosZ + this.x * sinZ;
    this.x = x1;
    this.y = y1;
  }

  getScreenX() {
    var scale = this.fl / (this.fl + this.z + this.cZ);
    return this.vpX + (this.cX + this.x) * scale;
  }

  getScreenY() {
    var scale = this.fl / (this.fl + this.z + this.cZ);
    return this.vpY + (this.cY + this.y) * scale;
  }
}
