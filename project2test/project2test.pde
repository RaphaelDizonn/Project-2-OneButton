// Raphael Dizon #218038464
// Project 2:  Moody Flappy Bird (One Button Game)
 
// This game is a Flappy Bird clone with a little twist to it. 
// CONTROLS: Click any key on your keyboard. Any key on your keyboard allows you to jump


int game, points, highscore, x, y, jump, pipesx[] = new int[2], pipesy[] =new int[2];
float pipeHeight = 799;
float pipeWidth = 35;
PImage back;
int bx = 0, bx2 = 600;
PImage mainback;
PImage moody;
int lx = 0, lx2 = 600;


void setup() {
   game = 1; 
   points = 0; 
   highscore = 0; 
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

}
void draw() { 
 image(mainback,lx,0); image(mainback,lx,0);
  mainback.resize (600,800);
 image(back,bx,0); image(back,bx2,0);

  if(game == 0) {
    jump += 1;
    y += jump;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CORNER);
       rectMode(CENTER);
        rect( pipesx[i], pipesy[i] - (pipeHeight/2+100), pipeWidth, pipeHeight);
      rect(pipesx[i], pipesy[i] + (pipeHeight/2+100), pipeWidth, pipeHeight);
      if(pipesx[i] < 0) {
        pipesy[i] = (int)random(200,height-200);
        pipesx[i] = width;
      }
      if(pipesx[i] == width/2) highscore = max(++points, highscore);
      if(y>height||y<0||(abs(150-pipesx[i])<25 && abs(y-pipesy[i])>100)) game=1;
      pipesx[i] -= 6;

  }
imageMode(CENTER);
    image(moody, 150, y);
 //   ellipse(150, y, 20, 20); // DEBUG
imageMode(CORNER);
// PARALLAX BACKGROUND
bx--; bx2--;
if(bx<-600) {bx = 600;} if(bx2<-600) {bx2 = 600;}

}
 

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
