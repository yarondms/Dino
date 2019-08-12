class FireballRecharge{
 
  final int numOfUnits = 20;
  final int totalDuration = 600;
  final int totalFlashDuration = 77;
  final int flashUnit = 7;
  
  int flashTimer = 0;
  int timer = 0;
  boolean[] units;
  float unitDuration;
  float unitW;
  final int x = 80;
  int y = 250;
  final int w = 263;
  int h = 14;
  boolean doneCharging = true;
  
  FireballRecharge(){    
    units = new boolean[numOfUnits];
    unitDuration = totalDuration / (numOfUnits);
    unitW = (w - 3 - (numOfUnits - 1)) / numOfUnits;
  }
  
  void recharge(){
    timer = totalDuration; 
    flashTimer = totalFlashDuration;
    doneCharging = false;
  }
  
  void reset(){
    timer = 0; 
    flashTimer = 0;
    doneCharging = true;
  }
  
  boolean isCharged(){
    return timer == 0;
  }
  
  void show(){
    image(fireballImages.ball[0],50,250);
    stroke(100);
    noFill();
    rect(x,y,w,h);
    
    noStroke();
    if (timer > 0) {
      timer--;
      int unitsPassed = int(((totalDuration - timer) / unitDuration));
      fill(60);
      for (int i = 0; i < unitsPassed; i++){
        rect(x + 2 + i * (unitW+1),y+2,unitW,h-3);
      }
    } else {
      if (!doneCharging){
        bell.play(1,0.05);
        doneCharging = true;
      }
      if (flashTimer > 0) flashTimer--;
      fill((flashTimer / flashUnit) % 2 == 0 ? 255 : 180 + flashTimer % flashUnit);
      rect(x+2,y+2,w-3,h-3);
    }    
  }
}
