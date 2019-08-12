class FireBall{
 
  final int startXVelocity = 8;
  final int switchRate = 10;
  final float g = .18;
  
  int x;
  float y;
  float w = 0;
  float h = 0;
  float fullWidth = 25;
  float fullHeight = 13;
  float timeToFullSize = 5;
  int vx;
  float vy = 0;
  boolean isBurning;
  int currentImageIndex;
  int switchCounter = 0;
  PImage[] images = new PImage[2];
  FireBallImages fireballImages;
  
  FireBall(Character c,FireBallImages img){
    fire.play(1,0.1);
     x = c.x + c.w - 5;
     y = c.y + 15;     
     vx = startXVelocity;
     fireballImages = img;
     images = img.ball;
  }
    
  void burn(){
    isBurning = true;
    images = fireballImages.fire;
    fullWidth = 98;
    fullHeight = 50;
    timeToFullSize = 10;
  }
  
  void advance(){
        
    if (isBurning){
      x -= speed;
    } else if (y >= ground){
      y = ground;
      burn();
    } else {
      x += vx;
      vy += g;
      y += vy;
    }  
  }
  
  void switchImages(){
    
    switchCounter++;
    
    if (switchCounter >= switchRate){
      switchCounter = 0;
      currentImageIndex = currentImageIndex == 0 ? 1 : 0; 
    } 
    
  }
  
  void grow(){
    if (w >= fullWidth) return; 
    w += fullWidth / timeToFullSize;
    h += fullHeight / timeToFullSize;
  }
  
  void show(){
    advance();
    switchImages();
    grow();
    image(images[currentImageIndex],x,y - h,w,h);   
  }
}
