// ------------------- //
//      Constants      //
// ------------------- //

final static int minSpeed = 7;
final static int maxSpeed = 20;
final static int[] speedUpSteps = {20,50,80,120,160,200,250,300,350,400,450,500,550,9999};
final static int speedUpMessageMaxSize = 50;
final static int gravity = 2; 
final static int fireballRechargeDuration = 300;

// initialized from setup:
static PFont f_reg_small;
static PFont f_reg_medium;
static PFont f_reg_large;
static PFont f_bold_small;
int ground;
int groundLine;
SoundFile boing;
SoundFile laughter;
SoundFile swoosh;
SoundFile fire;
SoundFile bell;
PGraphics moonGr;
PImage moon;



// ------------------- //
//      Variables      //
// ------------------- //

int speed;
int speedUpIndex;
PImage cloudImage;
int score = 0;
int frame = 0;
boolean gameOver;
int speedUpMessageTimer = 0;
int speedUpMessageSize = 0;
int gameOverTime = 0;
int fireballRechargeTimer;

// ----------------- //
//      Objects      //
// ----------------- //

Character character;
ObstacleType obsType;
Bg bg = new Bg();
GroundOrnaments grOrn;
Obstacles obs = new Obstacles();
RoadMarks rm = new RoadMarks();
Clouds cl;
Wind wind = new Wind();
FireBallImages fireballImages;
FireBall fireball;
FireballRecharge fireballRecharge = new FireballRecharge();
