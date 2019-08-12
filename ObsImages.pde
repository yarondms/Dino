class ObsImages{

  PImage[] images = new PImage[2];
  int w;
  int h;
  int switchRate;
  
  ObsImages(PImage img1, PImage img2,int _w,int _h,int _switchRate){
    images[0] = img1;
    images[1] = img2;
    w = _w;
    h = _h;
    switchRate = _switchRate;
  }
}
