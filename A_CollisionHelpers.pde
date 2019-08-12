// ----------------------------- //
//      Collision Detection      //
// ----------------------------- //

boolean hit(){
  for (int i=0; i< obs.numOfObs; i++){
    
    Obstacle o = obs.obs[i];
    
    checkObstacleFireballHit(o);
    
    // if obstacle is burning or in front or behind character do not check collision.
    if (o.isBurning || o.info.x > character.x+character.w || o.info.x+o.info.w < character.x) continue;
    
    // check rect collision
    if (rectRectOverlap(character.x + o.info.collisionOffsetRear,character.y,
                        character.w - o.info.collisionOffsetFront,character.h,
                        o.info.x,o.info.y,o.info.w,o.info.h)){ 
      if(o.info.isCamel()){       
        return checkAccurateCamelCollision(o);
      } else if(o.info.isTumbleWeed()){
        return checkAccurateTumbleWeedCollision(o); 
      }
      
      return true;
    }
  }
  
  return false;
}

void checkAllFireballHit(){
  for (int i=0; i< obs.numOfObs; i++){
    Obstacle o = obs.obs[i];
    checkObstacleFireballHit(o);
  }
}

void checkObstacleFireballHit(Obstacle o){
  
  if (fireball == null || o.isBurning) return;
    
  
  if (rectRectOverlap(fireball.x,int(fireball.y),int(fireball.w),int(fireball.h),
                      o.info.x,o.info.y,o.info.w,o.info.h)){
                        
                        if (!o.info.isHole()) o.burn();
                        if (fireball.y < ground) fireball = null;
  }
}

boolean checkAccurateCamelCollision(Obstacle o){
  // check each character bound line if intersecting with any camel bound line;
  boolean intersect = false;
  int[][] ch = character.getCharacterBounds();
  int[][] cl = o.info.getCamelBounds(o.info.x);
  for(int i=0; i<10;i++){
    for (int j=0; j < 7; j++){
      intersect |= lineLineIntersection(ch[i][0],ch[i][1],ch[i+1][0],ch[i+1][1],cl[j][0],cl[j][1],cl[j+1][0],cl[j+1][1]);
      if (intersect) {
        return true;
      }
    }
  }
  return false;
}

boolean rectRectOverlap(int r1x,int r1y,int r1w, int r1h,int r2x, int r2y, int r2w, int r2h){
   if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
      r1x <= r2x + r2w &&    // r1 left edge past r2 right
      r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
      r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
        return true;
  }
  return false; 
}

boolean lineLineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){
  
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    return true;
  }
  return false;
}

boolean checkAccurateTumbleWeedCollision(Obstacle o){
  
  int[][] ch = character.getCharacterBounds();
  int r = o.info.w / 2;
  for(int i=0; i<10;i++){
    if (lineCircleOverlap(ch[i][0],ch[i][1],ch[i+1][0],ch[i+1][1],o.info.x + r,o.info.y + int(o.tumbleWeedYOffset) + r, r-2))
    return true;
  }
  
  return false;
}

boolean lineCircleOverlap(float x1,float y1,float x2,float y2,float cx,float cy,float r){
  
  // this is the circle function where p is a point on the circumference:
  // (p.x - cx)^2 + (py - cy)^2 = r^2 
  //
  // t is a point on the line that intersects
  // with the circle.
  // t is defined as a fracture of the line segment where
  // 0 is the start of the line and 1 is the end of the line:
  // t.x = (x2 - x1) * t + x1;
  // t.y = (y2 - y1) * t + y1;
  //
  // since t is also a point on the circle,
  // we can put it in the circle function:
  // ((x2 − x1)*t + x1 − cx)^2 + ((y2 − y1)*t + y1 − cy)^2 = r^2
  //
  // it's a quadratic function, so we get t1 and t2,
  // which is logical since an infinite line that intersects
  // a circle will have two points of intersection
  // (if t1=t2, the line is tangent to the circle).
  // if either of these points (t1,t2) is between 0-1 then
  // it is inside the line segment.
  // --------------------------------------------------------
  
  
  // translate the points so x1,y1 are on 0,0
  x2 -= x1;
  y2 -= y1;
  cx -= x1;
  cy -= y1;
  
  float a = x2 * x2 + y2 * y2 ;
  float b = -(2 * x2 * cx + 2 * y2 * cy); 
  float c = cx * cx + cy * cy - r * r;
  
  float discriminant = b*b-4*a*c;
  if( discriminant < 0 )
  {
    // no intersection
    return false;
  }
  else
  {
    // line didn't totally miss the circle,
    // so there is a solution to
    // the equation.
  
    discriminant = sqrt( discriminant );
  
    // either solution may be on or off the line so we need to test both.
    // t1 is always the smaller value, because BOTH discriminant and
    // a are nonnegative.
    float t1 = (-b - discriminant)/(2*a);
    float t2 = (-b + discriminant)/(2*a);
  
    // 4x HIT cases:
    //          -o->             --|-->  |            |  --|->                 | -> |
    // Impale(t1>=0 hit,t2<=1 hit), Poke(t1<=1 hit,t2>1), ExitWound(t1<0, t2<=1 hit), CompletelyInside(t1<0, t2>1)
  
    // 2x MISS cases:
    //       ->  o                     o ->     
    // FallShort (t1>1,t2>1), Past (t1<0,t2<0)
  
    if( t1 >= 0 && t1 <= 1 )
    {
      // t1 is the intersection, and it's closer than t2
      // (since t1 uses -b - discriminant)
      // Impale, Poke
      return true ;
    }
  
    // here t1 didn't intersect so we are either started
    // inside the circle or completely past it
    if( t2 >= 0 && t2 <= 1 )
    {
      // ExitWound
      return true ;
    }
  
    if (t1<0 && t2>1)
    {
      // CompletelyInside
      return true;
    }
    // no intn: FallShort, Past
    return false ;
  }
}
