class Character {

  final int minX = 50;
  final int maxX = 360;
  final int defaultX = 150;
  final int jumpVelocity = 25;
  final int lateralStep = 5;
  final int soundDuration = 1;
  
  int x = 150;
  int maxY;
  int y;
  int w = 60;
  int h = 39;
  int vy = 0; 
  PImage dino1;
  PImage dino2;
  int maxDelay = 5;
  int delay = 0;
  boolean altImage;
  boolean safeMode;
  int safeModeCounter = 0;
  int opacity = 255;
  boolean moveLeftActivated;
  boolean moveRightActivated;
  
  Character(){    
    dino1 = loadImage("dino1.png");
    dino2 = loadImage("dino2.png");
    reset();
  }
  
  void reset(){
    this.maxY =  ground - this.h;
    this.y = maxY;
    this.vy = 0;
    x = defaultX; 
    stopMovingLeft();
    stopMovingRight();
  }
  
  void activateSafeMode(){
    safeMode = true;
    safeModeCounter = 0;
  }
  
  void deactivateSafeMode(){
    safeModeCounter = 0;
    safeMode = false;
    opacity = 255;
  }
  
  void jump(){
    if (this.y == this.maxY){
      this.vy -= jumpVelocity;
      boing.play(1.4,0.03);
    }
  }
  
  void moveLeft(){    
    moveLeftActivated = true;
    stopMovingRight();
  }
  
  void moveRight(){    
    moveRightActivated = true;
    stopMovingLeft();
  } 
  
  void stopMovingLeft(){
    moveLeftActivated = false;
  }
  
  void stopMovingRight(){
    moveRightActivated = false; 
  }
  
  void Move(){
    
    if (y >= maxY){
      if (x > minX && moveLeftActivated)
        x -= lateralStep;
      else if (x < maxX && moveRightActivated)
        x += lateralStep;
    }
    
    this.vy += gravity;
    this.y += this.vy;
    if (this.y >= this.maxY) {
       this.y = this.maxY; 
       this.vy = 0;
    }        
  }
  
  void Show() {
    
    delay--;
    if (delay <= 0) {
      altImage = !altImage;
      delay = maxDelay;
    }
        
    if (safeMode){
       safeModeCounter++;
       if((safeModeCounter / 5) % 2 == 0){ 
         opacity = 80;
       } else {
         opacity = 200;
       }
       if(safeModeCounter >= 190){
         deactivateSafeMode();
       }
    }
    
    tint(255,opacity);
    if (altImage)
      image(dino1,x,y,w,h);
    else
      image(dino2,x,y,w,h);
      
    tint(255,255);
    
    //if (soundPlaying) {
    //  soundPlaying = false; 
    //  pulse.stop();
    //}
     //DRAW CHARACTER COLLISION BOUNDS
    //int[][] b = getCharacterBounds();
    //stroke(255,255,0);
    //noFill();
    //beginShape();
    //for (int i=0; i<11;i++){
    //  vertex(b[i][0],b[i][1]);
    //}
    //endShape();
    
  }
  
  int[][] getCharacterBounds(){
    int[][] b = new int[11][2];
    
    b[0][0] = x;
    b[0][1] = y+17;
    b[1][0] = x+15;
    b[1][1] = y+19;
    b[2][0] = x+41;
    b[2][1] = y;
    b[3][0] = x+51;
    b[3][1] = y;
    b[4][0] = x+w;
    b[4][1] = y+7;
    b[5][0] = x+w;
    b[5][1] = y+16;
    b[6][0] = x+49;
    b[6][1] = y+16;
    b[7][0] = x+35;
    b[7][1] = y+h;
    b[8][0] = x+20;
    b[8][1] = y+h;
    b[9][0] = x;
    b[9][1] = y+20;
    b[10][0] = x;
    b[10][1] = y+17;
    
    return b;
  }
}
