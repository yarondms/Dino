class Clouds{
  
  Cloud[] clouds = new Cloud[3];  
  int xRange;
  int yMin;
  int yMax;
  int maxDelay = 10;
  int delay = 0;
  
  Clouds(){ 
    yMin = ground - 200;
    yMax = ground - 155;
    xRange = width / 2;
    for (int i=0; i < 3; i++) addCloud(i);      
  }
  
  void addCloud(int index){
      int x = int(random(xRange * index,xRange * (index+1) - 100));
      int y = int(random(yMin,yMax));
      clouds[index] = new Cloud(x,y);  
  }
  
  void pop(){
    for (int i=0; i<2; i++){
      clouds[i] = clouds[i+1]; 
    }
    
    addCloud(2);
  }
  
  void show(){
    delay--;
    for (int i=0; i < 3; i++){
      if (delay == 0){
        clouds[i].advance();        
      }
      clouds[i].show();      
    }
    
    if (delay <= 0) delay = maxDelay;
    
    if (clouds[0].x < -100) pop();
  }
  
}
