class GroundOrnaments{
  
  PImage[] images = new PImage[2];
  GroundOrnament[] ornaments = new GroundOrnament[2];
  
  GroundOrnaments(){
    images[0] = loadImage("pit.png");
    images[1] = loadImage("hill.png");
    addNewOrnament(0);
    addNewOrnament(1);   
  }
  
  void addRandom(){ 
    if (ornaments[0].x > -ornaments[0].size) return;
    pop();
    addNewOrnament(1);
  }
  
  void pop(){
    ornaments[0] = ornaments[1]; 
  }
  
  void addNewOrnament(int xSection){
    int imageIndex = int(random(2));
    ornaments[xSection] = new GroundOrnament(xSection,images[imageIndex],imageIndex == 0);
  }
  
  void show(){
    tint(120,255);
    for(int i=0; i < 2;i++){
      ornaments[i].show(); 
    }
    tint(255,255);
    addRandom();
  }
}
