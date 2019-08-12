class RoadMark{
   int x;
   int y;
   int w;
   
   void init(int yValue){
      x = width; 
      y = yValue;
      w = 1;
   }
   
   void advance(){
      x -= speed; 
   }
   
   void show(){
     fill(150);
      rect(x,y,w,1.2); 
   }
}
