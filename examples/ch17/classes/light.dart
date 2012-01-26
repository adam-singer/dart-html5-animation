class Light {
  num x;
  num y;
  num z;
  num brightness;
    
  Light() {
    this.x = -100;
    this.y = -100;
    this.z = -100;
    this.brightness = 1;
  }
  
  Light.withParameters(this.x,this.y,this.z) {
    this.brightness = 1;
  }
  
  Light.withBrightness(this.x,this.y,this.z,this.brightness);
  
  setBrightness(var b) {
    this.brightness = Math.min(Math.max(b, 0), 1);
  }
}
