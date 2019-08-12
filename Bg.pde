class Bg{
 
  int[] mountains;
  int maxY;
  int minY;
  float upChance = 0;
  //int center;
  int lastDirDown = 0;
  
  void init(){
    maxY = ground - 40;
    minY = ground - 100;    
    mountains = new int[width];
    mountains[0] = maxY - ((maxY-minY)/2);
     for (int i=1; i<width; i++){
         calcDot(i);
     }
  }
  
  void calcDot(int index){
 
      int dirDown;
      
      if (mountains[index-1] >= maxY){       
        dirDown = -1;
      } else if (mountains[index-1] < minY){
        dirDown = 1;
      } else {
        float rand = random(1);
        if (rand >= 0.5 - upChance){
          dirDown = 1;
        } else {
          dirDown = -1;
        }
      }
      
      mountains[index] = mountains[index-1] + dirDown;
      upChance = 0.25 * (-dirDown);
      lastDirDown = dirDown;   
  }
  
  void Advance(){
   for (int i = 0; i < width-1; i++){
      mountains[i] = mountains[i+1];
   }
   calcDot(width-1);
  }
  
  void Show(){
    noFill();
    stroke(85);
    beginShape();
      for (int i=0; i< width; i+=3){
         curveVertex(i,mountains[i]); 
      }
     endShape();
  }
}
