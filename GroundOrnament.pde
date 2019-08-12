class GroundOrnament{
  int size;
  PImage image;
  int x;
  boolean isPit;
  
  GroundOrnament(int xSection,PImage img,boolean _isPit){
    int sectionX = xSection * width;
    x = int(random(sectionX,sectionX + width - size * 2));
    image = img;
    isPit = _isPit;
    size = isPit ? 10 : 20;
  }
  
  void advance(){
    x -= speed; 
  }
  
  void show(){
    image(image,x,isPit ? groundLine-1 : groundLine-size+1);
    advance();    
  }
}
