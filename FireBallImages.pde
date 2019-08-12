class FireBallImages{
 
  PImage[] ball = new PImage[2];
  PImage[] fire = new PImage[2]; 
  //static PImage[] explode = new PImage[2];
  
  FireBallImages(){
    // load images
    ball[0] = loadImage("fireball1.png");
    ball[1] = loadImage("fireball2.png");
    fire[0] = loadImage("fire1.png");
    fire[1] = loadImage("fire2.png");
  }
}
