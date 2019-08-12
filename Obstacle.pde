class Obstacle{
  
  ObstacleInfo info;
  int switchImageCounter = 0;
  int currentImageIndex = 0;
  float rotation = 0;
  float tumbleWeedYOffset = 0;
  int tumbleWeedYDir = -1;
  boolean isBurning;
  PImage[] images;
  
  void init(){
     info =  obsType.GetInfo(int(random(12 + min(score / 100.0,1.0))));
     images = info.images;
  }
  
  void burn(){
    isBurning = true;
    images = info.burningImages;
    info.y -= info.burnH - info.h;
    info.w = info.burnW;
    info.h = info.burnH;   
    info.switchImageRate = 10;
    rotation = 0;
  }
  
  void advance(){ 
    
     info.x -= info.isMoving() ? speed + 1 : speed; 
     
     if (info.isTumbleWeed()){
       if (!isBurning) {
         rotation -= PI/32;
         if (rotation <= -2*PI) rotation = 0;
       }
       tumbleWeedYOffset += .3 * tumbleWeedYDir;;
       if (tumbleWeedYOffset < -10 || tumbleWeedYOffset > 0)
       tumbleWeedYDir *= -1;
     } else if (isBurning && info.isBird() && info.y < ground - info.burnH){
         info.vy += info.g;
         info.y += int(info.vy);
     }
  }
  
  void flipCurrentImageIndex(){
    if (currentImageIndex == 1)
      currentImageIndex = 0;
    else
      currentImageIndex = 1;
      switchImageCounter = 0;
  }
  
  void show(){
        
    if (info.switchImageRate > 0){
      switchImageCounter++;
      if (switchImageCounter >= info.switchImageRate){
        flipCurrentImageIndex();
      }
    }
            
    if (info.isTumbleWeed()){
      showTumbleWeed();
    } else {
      image(images[currentImageIndex],info.x,info.y,info.w,info.h);
    }    
  }
  
  void showTumbleWeed(){
    pushMatrix();
    translate(info.x + info.w/2,info.y + info.h/2 + tumbleWeedYOffset);
    rotate(rotation);
    image(images[currentImageIndex],-info.w/2,-info.h/2,info.w,info.h);
    popMatrix();
    // draw shadow
    fill(255,10);
    noStroke();
    ellipseMode(CENTER);
    ellipse(info.x + info.w/2,ground,info.w - 25 - tumbleWeedYOffset*2,5);
    
    //Draw tumble weed bounds
    //noFill();
    //stroke(255);
    //ellipseMode(CENTER);
    //ellipse(info.x + 25,info.y + 25 + tumbleWeedYOffset,50,50);
  }
}
