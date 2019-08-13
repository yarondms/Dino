import processing.sound.*;

void setup(){
   size(800,600);
   background(0);
   loadFonts();
   loadSounds();
   loadMoon();
   showInstructions();
   character = new Character();
   cloudImage = loadImage("cloud.png");
   obsType = new ObstacleType();
   ground = height - 50;
   groundLine = ground - 10;
   this.bg.init();
   this.rm.init();
   this.cl = new Clouds();
   grOrn = new GroundOrnaments();
   fireballImages = new FireBallImages();
   reset();
   stroke(255);
   loop();
}

void keyPressed(){
  
  if (gameOver){
    if (key == ' ' && millis()/200 - gameOverTime > 1){
      gameOver = false;
      reset();
      loop();
    }
  } else {
    if (key == ' ' && fireballRecharge.isCharged()){
      fireball = new FireBall(character,fireballImages);
      fireballRecharge.recharge();;
    } else if (key == CODED){
      switch (keyCode) {  
      case UP:
        character.jump();
        break;
      case LEFT:
        character.moveLeft();
        break;
      case RIGHT:
        character.moveRight();
        break;             
    }
    }
    
  }  
}

void keyReleased(){
  if (key == CODED){
    switch (keyCode){
      case LEFT:
        character.stopMovingLeft();
        break;
      case RIGHT:
        character.stopMovingRight();
        break;
    }
  }
}

void draw(){
  
  fill(0);
  rect(0,190,width,height);
   
  fireballRecharge.show();
    
  showAll();
  calcScore();
  speedUp(); 
  showScore();
  
  if (character.safeMode){
    checkAllFireballHit();
  } else if (hit()) {
    gameOver();
    return;
  } 
  
  prepareToSpeedUp();
  showSpeedUpMessage();
}
