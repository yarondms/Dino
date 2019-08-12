class Wind{
 
  int x;
  WindLine[] lines = new WindLine[4];
  int w = 150;
  int timer;
  final int timeOnScreen = 40;
  
  Wind(){
    x = width;    
    timer = timeOnScreen;
    int step = (width + w) / timeOnScreen; 
    lines[0] = new WindLine(30,ground-70,120,step);
    lines[1] = new WindLine(0,ground-55,50,step);
    lines[2] = new WindLine(100,ground-30,20,step);
    lines[3] = new WindLine(15,ground-20,80,step);    
  }
  
  void show(){
    if(timer < 0) return;
    stroke(120);
    for (int i=0; i<4;i++){
      lines[i].show(); 
    }
    timer--;
  }
}
