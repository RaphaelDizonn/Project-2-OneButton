// Josh Raphael Dizon #218038464
// Project 2:  Flappy Bird (One Button Game)
 
// This game is a Flappy Bird clone with a darker setting to it.
// CONTROLS: Click any key on your keyboard. Any key on your keyboard allows you to jump


int game, points, total, jump;
int x, y;
int pipesx[] = new int[2], pipesy[] =new int[2]; 
float pipeHeight = 799; // rect pipe height
float pipeWidth = 35; // rect pipe width
PImage back; // clouds
int bx = 0, bx2 = 600; // parallax setting
PImage mainback; // background
PImage moody; // bird
int lx = 0, lx2 = 600; // parallax setting
float birdCoord = 150; // x coordinates for the bird = points
PImage flappybird; // for beginning screen

void setup() {
   game = 1; 
   points = 0; 
   total = 0; 
   jump = 0; 
  size(600,800,P2D);
  fill(0,0,0);
  textSize(20);  
imageMode(CORNER);
mainback = loadImage("l0_bg_1.png");
mainback.resize (600,800);
back = loadImage ("l1_bg_1.png");
back.resize (600,800);
moody = loadImage("moody.png");
moody.resize (65,65);
flappybird = loadImage("flappybird.png");

}
void draw() { 
 
  // background images
  // https://bit-life.itch.io/free-parallax-clouds-background
  
  image(mainback,lx,0); image(mainback,lx,0);
  mainback.resize (600,800);
 image(back,bx,0); image(back,bx2,0);

  if(game == 0) { // Code derived from "gaspar coding" on Youtube https://www.youtube.com/watch?v=UIlzIwqmOYE&t=585s
    jump += 1;
    y += jump;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CORNER);
       rectMode(CENTER);
       
       // pipes/wall used with rect
        rect( pipesx[i], pipesy[i] - (pipeHeight/2+100), pipeWidth, pipeHeight);
      rect(pipesx[i], pipesy[i] + (pipeHeight/2+100), pipeWidth, pipeHeight);
      if(pipesx[i] < 0) {
        pipesy[i] = (int)random(200,height-200);
        pipesx[i] = width;
      }
      if(pipesx[i] == birdCoord) total = max(++points, total); // code derived from "gaspar coding" on Youtube https://www.youtube.com/watch?v=UIlzIwqmOYE&t=585s
      if(y>height||y<0||(abs(birdCoord-pipesx[i])<25 && abs(y-pipesy[i])>100)) game=1;
      pipesx[i] -= 6;

// points
text("points: "+ points, 10, 20);
   
   // bird
   // https://drawception.com/game/LB7bLsx91Z/depressing-flappy-bird/
    
    imageMode(CENTER);
    image(moody, birdCoord, y);
imageMode(CORNER);
 
 // debug
  //   ellipse(150, y, 20, 20);

}

  }

else{
 
  // menu screen
  text ("Click any key to start", 200, 500);
    text ("Controls: Click any key to jump", 150, 600);

fill(255, 255, 255);

}

// PARALLAX BACKGROUND
bx--; bx2--;
if(bx<-600) {bx = 600;} if(bx2<-600) {bx2 = 600;}

}
 

void keyReleased() { // any key on the keyboard allows to jump
  jump = -15; // change number to change height of jump
  
  if(game==1) {
    pipesx[0] = 600;
    pipesy[0] = y = height/2;
    pipesx[1] = 900;
   pipesy[1] = 600;
 game = points = 0;
  }
}
