/*
** Describes a RGB color. */
class Color 
{
  num R, G, B;
  String _rawR, _rawG, _rawB;
  
  Color(Colors color){
    _parseAndLoadColors(color._hex);
  }
  
  Color.fromRGB(this.R, this.G, this.B){
    _rawR = R.toRadixString(16).toUpperCase();
    _rawG = G.toRadixString(16).toUpperCase();
    _rawB = B.toRadixString(16).toUpperCase();
  }
  
  //TODO Color.fromHSV(...)
  
  Color.hex(String hex){
    _parseAndLoadColors(hex);
  }
 
  void _parseAndLoadColors(String color){
    if (!color.startsWith("#")) return;
    
    String c = color.replaceFirst("#","");

    if (c.length != 6) return;
    
      _rawR = c.substring(0,2);
      _rawG = c.substring(2,4);
      _rawB = c.substring(4,6);
      R = Math.parseInt("0x" + _rawR);
      G = Math.parseInt("0x" + _rawG);
      B = Math.parseInt("0x" + _rawB);

  } 
  
  String toString() => "#" + _rawR + _rawG + _rawB;
  
  String get _type() => "Color";
}
