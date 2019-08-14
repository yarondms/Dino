// ------------------------ //
//      Initialization      //
// ------------------------ //

void loadFonts(){
  f_reg_small = createFont("Segoe UI", 16);
  f_reg_medium = createFont("Segoe UI",32);
  f_reg_large = createFont("Segoe UI",62);
  f_bold_small = createFont("Segoe UI Bold",14); 
}

void loadSounds(){
  boing = new SoundFile(this,"boing.mp3");
  laughter = new SoundFile(this,"game_over.mp3");
  swoosh = new SoundFile(this,"swoosh.mp3");
  fire = new SoundFile(this,"fireball.mp3");
  bell = new SoundFile(this,"bell.mp3");
}

void loadMoon(){
  moonGr = createGraphics(100,100);   
  moonGr.beginDraw();
  moonGr.background(0,0,0,0);
  moonGr.fill(255);
  moonGr.noStroke();
  moonGr.ellipse(28,28,44,44);
  moonGr.filter(BLUR,2);
  moonGr.endDraw();
  moon = moonGr.get();
}

void reset(){
  speed = minSpeed;
  speedUpIndex = 0; 
  score = 0;
  frame = 0;
  bg.init();
  obs = new Obstacles();
  this.character.reset();
  this.character.activateSafeMode();
  fireball = null;
  fireballRecharge.reset();
  laughter.stop();
}



// -------------- //
//      Draw      //
// -------------- //

void showAll(){
  image(moon,width - 200,ground-200);
  stroke(100);
  line(0,groundLine,width,groundLine); 
  this.rm.show();
  grOrn.show();
  this.cl.show();
  bg.Advance();
  bg.Show();
  this.obs.randomAdd(); 
  this.obs.show();
  if (fireball != null) fireball.show();
  this.character.Move();
  this.character.Show();
  if (wind != null) this.wind.show();
}

void showInstructions(){
  
  fill(255);
  stroke(255);
  strokeWeight(2);
  pushMatrix();
  translate(width / 2 - 150,50);
  textFont(f_bold_small);
  text("Instructions",112,-15);
  textFont(f_reg_small);
  text("Jump",133,17);
  beginShape();
  vertex(145,36);
  vertex(150,26);
  vertex(155,36);
  vertex(145,36);
  endShape();
  text("Move Left",30,53);
  beginShape();
  vertex(125,41);
  vertex(115,46);
  vertex(125,51);
  vertex(125,41);
  endShape();
  beginShape();
  vertex(175,41);
  vertex(185,46);
  vertex(175,51);
  vertex(175,41);
  endShape();
  text("Move Right",200,53);
  text("Space: Fire",113,78);
  text("(Holes can NOT be burnt)",55,105);
  popMatrix();
}

// --------------- //
//      Score      //
// --------------- //

void calcScore(){
  frame++;
  if (frame >= 60){
    score ++;
    frame = 0;
  }
}

void showScore(){
  fill(255);
  textAlign(LEFT,TOP);
  textFont(f_reg_medium);
  text("Score: " + score,50,200);
}



// ------------------ //
//      Speed Up      //
// ------------------ //

void prepareToSpeedUp(){
  int timeToSpeedUp = speedUpSteps[speedUpIndex] - score;
  if (speed <= maxSpeed && timeToSpeedUp <= 3 && timeToSpeedUp >= 0){
    fill(255);
    textFont(f_bold_small);
    textAlign(CENTER,BOTTOM);
    text("Speed Up In: " + timeToSpeedUp,width / 2,ground - 70);
  }
}

void speedUp(){
  if (frame == 0 && score > 0 && score % speedUpSteps[speedUpIndex] == 0 && speed <= maxSpeed){
    speed++;
    swoosh.play(.4,0.07);
    speedUpIndex++; 
    character.activateSafeMode();
    wind = new Wind();
    startSpeedUpMessage();
  }
}

void startSpeedUpMessage(){
  speedUpMessageTimer = 180;
  speedUpMessageSize=1;
}

void showSpeedUpMessage(){
  if (speedUpMessageTimer > 0){
    textSize(speedUpMessageSize);
    fill(255);
    textAlign(CENTER,BOTTOM);
    text("Speed Up !",width/2,height/2 + 70);
    if (speedUpMessageSize < speedUpMessageMaxSize) speedUpMessageSize++;
    speedUpMessageTimer--;
  } 
}



// ------------------- //
//      Game Over      //
// ------------------- //

void gameOver(){
  laughter.play(1,0.05);
  textFont(f_reg_large);
  textAlign(CENTER,CENTER);
  fill(255);
  text("GAME OVER",width / 2,height / 2);
  textFont(f_reg_medium);
  text("Press 'Space' to restart",width / 2,height / 2 + 50);
  gameOver = true;
  noLoop();
  gameOverTime = millis() / 200;
}
