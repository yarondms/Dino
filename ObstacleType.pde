class ObstacleType{
  
  PImage turtle1;
  PImage turtle2;
  PImage cactus;
  PImage alligator1;
  PImage alligator2;
  PImage camel1;
  PImage camel2;
  PImage hole;
  PImage bird1;
  PImage bird2;
  PImage tumbleWeed;
  PImage burning;
  PImage largeFlatBurn1;
  PImage largeFlatBurn2;
  PImage narrowHighBurn1;
  PImage narrowHighBurn2;
  PImage roundSmallBurn1;
  PImage roundSmallBurn2;
  PImage roundLargeBurn1;
  PImage roundLargeBurn2;
  PImage smallFlatBurn1;
  PImage smallFlatBurn2;
  PImage wideShortFlatBurn1;
  PImage wideShortFlatBurn2;
  
  ObstacleType(){
    turtle1 = loadImage("turtle1.png");
    turtle2 = loadImage("turtle2.png");
    cactus = loadImage("cactus.png");
    alligator1 = loadImage("alligator1.png");
    alligator2 = loadImage("alligator2.png");
    camel1 = loadImage("camel1.png");
    camel2 = loadImage("camel2.png");
    hole = loadImage("hole.png");
    bird1 = loadImage("bird1.png");
    bird2 = loadImage("bird2.png");
    tumbleWeed = loadImage("tumbleWeed.png");
    burning = loadImage("burning.png");
    largeFlatBurn1 = loadImage("large_flat_burn1.png");
    largeFlatBurn2 = loadImage("large_flat_burn2.png");
    narrowHighBurn1 = loadImage("narrow_high_burn1.png");
    narrowHighBurn2 = loadImage("narrow_high_burn2.png");
    roundSmallBurn1 = loadImage("round_small_burn1.png");
    roundSmallBurn2 = loadImage("round_small_burn2.png");
    roundLargeBurn1 = loadImage("round_large_burn1.png");
    roundLargeBurn2 = loadImage("round_large_burn2.png");
    smallFlatBurn1 = loadImage("small_flat_burn1.png");
    smallFlatBurn2 = loadImage("small_flat_burn2.png");
    wideShortFlatBurn1 = loadImage("wide_short_flat_burn1.png");
    wideShortFlatBurn2 = loadImage("wide_short_flat_burn2.png");
  }
  
  ObstacleInfo GetInfo(int type){
    
    ObsImages regImages;
    ObsImages burnImages;
    ObsBoundsOffset boundsOffset;
    
    switch(type){
      case 0:
      case 1:
        regImages = new ObsImages(turtle1,turtle2,20,12,40);
        burnImages = new ObsImages(smallFlatBurn1,smallFlatBurn2,20,27,0);
        boundsOffset = new ObsBoundsOffset(30,20);
        break;
      case 2:
      case 3:
        regImages = new ObsImages(cactus,cactus,20,40,0);
        burnImages = new ObsImages(narrowHighBurn1,narrowHighBurn2,20,50,0);
        boundsOffset = new ObsBoundsOffset(0,0);
        break;
      case 4:
      case 5:
        regImages = new ObsImages(alligator1,alligator2,60,18,20);
        burnImages = new ObsImages(wideShortFlatBurn1,wideShortFlatBurn2,60,31,0);
        boundsOffset = new ObsBoundsOffset(45,25);
        break;
      case 6:
      case 7:
        regImages = new ObsImages(camel1,camel2,50,50,10);
        burnImages = new ObsImages(largeFlatBurn1,largeFlatBurn2,52,70,0);
        boundsOffset = new ObsBoundsOffset(0,0);
        break;
      case 8:
      case 9: 
        regImages = new ObsImages(hole,hole,70,25,0);
        burnImages = new ObsImages(null,null,0,0,0);
        boundsOffset = new ObsBoundsOffset(55,25);
        break;
      case 10:
      case 11:
        regImages = new ObsImages(bird1,bird2,30,24,8);
        burnImages = new ObsImages(roundSmallBurn1,roundSmallBurn2,30,60,0);
        boundsOffset = new ObsBoundsOffset(0,0);
        break;
      default: 
        regImages = new ObsImages(tumbleWeed,tumbleWeed,50,50,0);
        burnImages = new ObsImages(roundLargeBurn1,roundLargeBurn2,50,100,0);
        boundsOffset = new ObsBoundsOffset(0,0);
        break;
    }
    
    return new ObstacleInfo(regImages,burnImages,boundsOffset,type);
  }
  
  
}
