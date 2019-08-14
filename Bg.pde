class Bg{
 
  int maxY;
  int minY;
  float xOff = 0;
  
  
  void init(){
    maxY = ground - 40;
    minY = ground - 100;    
    xOff=0;
    noiseSeed(int(random(1000)));
  }
  
  void Advance(){
   xOff += 0.01;
  }
  
  void Show(){
    noFill();
    stroke(85);
    beginShape();
      for (int i=0; i< width; i+=3){
         vertex(i,map(noise(xOff + i * 0.01),0,1,minY,maxY));
      }
     endShape();
  }
}
