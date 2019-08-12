class Obstacles{
 
  Obstacle[] obs = new Obstacle[100];
  int numOfObs = 0;
  int delay = 0;
  
  void randomAdd(){
    delay--;
    if (delay > 0) return;
    float i = random(1);
    if (i>=0.987){
      obs[numOfObs] = new Obstacle();
      obs[numOfObs].init();
      delay = (obs[numOfObs].info.w + 3 * character.w) / speed;
      numOfObs++;
    }
  }
  
  void pop(){
    if (numOfObs == 0){
      return;
    }
    
    if (numOfObs == 1){
      obs[0] = null;
      numOfObs=0;
      return;
    }
    
    for (int i=0;i<numOfObs-1;i++){
      obs[i] = obs[i+1];
    }
    
    obs[numOfObs-1] = null;
    numOfObs--;
  }
  
  void show(){
     if (numOfObs==0) return;
     
     if (obs[0].info.x <= -20){
       pop();
     }
     for (int i=0; i<numOfObs;i++){
       obs[i].advance();
       obs[i].show();
     }
  }
}
