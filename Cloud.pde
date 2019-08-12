class Cloud{
  int x;
  int y;
  int w;
  int h;
  PImage img;
  
  Cloud(int _x,int _y){
    x = _x;
    y = _y;
    float sizeFactor = int(random(5,11)) / 10.0;
    w = int(100 * sizeFactor);
    h = int(50 * sizeFactor);
    img = cloudImage;
  }
  
  void advance(){
    x--;  
  }
  
  void show(){
    image(img,x,y,w,h);
  }
}
