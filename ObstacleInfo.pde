class ObstacleInfo{
 
  final float g = 0.5;
  PImage[] images = new PImage[2];
  PImage[] burningImages = new PImage[2];
  int x;
  int y;
  int w;
  int h;
  int burnW;
  int burnH;
  float vy = 0;
  int switchImageRate;
  int collisionOffsetFront;
  int collisionOffsetRear;
  int type;
  
  
  ObstacleInfo(ObsImages regImages,ObsImages burnImages,ObsBoundsOffset boundsOffset, int _type){
    images[0] = regImages.images[0];
    images[1] = regImages.images[1];
    burningImages[0] = burnImages.images[0];
    burningImages[1] = burnImages.images[1];
    type = _type;
    x = isMoving() ? width + 50 : width;
    y = ground - regImages.h;
    if (isHole()){
      y = groundLine - 1;
    } else if(isBird()){
      y = groundLine - int(random(65,95)); 
    }
    w = regImages.w;
    h = regImages.h;
    burnW = burnImages.w;
    burnH = burnImages.h;
    switchImageRate = regImages.switchRate;
    collisionOffsetFront = boundsOffset.front;
    collisionOffsetRear = boundsOffset.rear;
  }
  
  boolean isCamel(){
    return type==6 || type==7; 
  }
  
  boolean isHole(){
    return type == 8 || type == 9; 
  }
  
  boolean isTumbleWeed(){
    return type >= 12; 
  } 
  
  boolean isBird(){
    return type==10 || type==11; 
  }
  
  boolean isMoving(){
    return isTumbleWeed() || isBird(); 
  }
  
  int[][] getCamelBounds(int x){
      int[][] b = new int[8][2];
      b[0][0] = x;
      b[0][1] = y + 6;
      b[1][0] = x + 9;
      b[1][1] = y;
      b[2][0] = x+21;
      b[2][1] = y;
      b[3][0] = x+35;
      b[3][1] = y+6;
      b[4][0] = x+48;
      b[4][1] = y+31;
      b[5][0] = x+48;
      b[5][1] = y+h;
      b[6][0] = x;
      b[6][1] = y+h;
      b[7][0] = x;
      b[7][1] = y + 6;
      
      return b;
  }
}
