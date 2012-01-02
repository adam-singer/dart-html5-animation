class Tree { 
  num x;
  num y;
  num xpos;
  num ypos;
  num zpos;
  num scaleX;
  num scaleY;
  String color;
  num alpha;
  num lineWidth;
  List<num> branch;
  
  Tree() {
    this.x = 0;
    this.y = 0;
    this.xpos = 0;
    this.ypos = 0;
    this.zpos = 0;
    this.scaleX = 1;
    this.scaleY = 1;
    this.color = "#ffffff";
    this.alpha = 1;
    this.lineWidth = 1;
    this.branch = new List<num>();
    
    //generate some random branch positions
    this.branch.add(-140 - Math.random() * 20);
    this.branch.add(-30 - Math.random() * 30);
    this.branch.add(Math.random() * 80 - 40);
    this.branch.add(-100 - Math.random() * 40);
    this.branch.add(-60 - Math.random() * 40);
    this.branch.add(Math.random() * 60 - 30);
    this.branch.add(-110 - Math.random() * 20);
    
  }
  
  void draw(var context) {
    context.save();
    context.translate(this.x, this.y);
    context.scale(this.scaleX, this.scaleY);
    
    context.lineWidth = this.lineWidth;
    context.strokeStyle = utilslib.Utils.colorToRGB(this.color, this.alpha);
    context.beginPath();
    context.moveTo(0, 0);
    context.lineTo(0, this.branch[0]);
    context.moveTo(0, this.branch[1]);
    context.lineTo(this.branch[2], this.branch[3]);
    context.moveTo(0, this.branch[4]);
    context.lineTo(this.branch[5], this.branch[6]);
    context.stroke();
    context.restore();
  }
}
