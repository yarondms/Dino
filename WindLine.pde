class WindLine{

  int x1;
  int x2;
  int y;
  int step;
  
  WindLine(int xOffset,int _y, int len, int _step){
     x1 = width + xOffset;
     x2 = width + xOffset + len;
     y = _y;
     step = _step;
  }
  
  void advance(){
    x1 -= step;
    x2 -= step;
  }
  void show(){
    advance();
    line(x1,y,x2,y);
  }
}
