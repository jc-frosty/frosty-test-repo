//Planet Escape- Jonathan Chen, Andre Champeau
//Jonathan
int[] AxCoor=new int[5];
int[] AyCoor=new int[5];
int Asp=1;
int SxCoor=200;
int SyCoor=325;
boolean gameOn=false;
boolean endGame=false;
void setup(){
  size(500,500);
  textSize(30);
  for (int i=0; i<5;i++){
    AxCoor[i]=int(random(0,450));
    AyCoor[i]=int(random(-10,-1000));
  }
}
void draw(){
  background(0);
  if ( gameOn==true){
    Game();
  }else{
    intro();
  }
}
//controls
void keyPressed(){
  if(key=='a'){
    SxCoor-=25;
  }
  if(key=='d'){
    SxCoor+=25;
  }
  if(key=='w'){
    SyCoor-=25;
  }
  if(key=='s'){
    SyCoor+=25;
  }
}
//Andre
void mousePressed(){
  if(mouseButton==LEFT){
    gameOn=true;
  }
}
void Game(){
  SpaceShip();
  Planet();
  Asteroid();
  End();
}
//Game Mechanics - Andre
//Asteroid
void Asteroid(){
  fill(200);
  for(int b=0; b<5; b++){
    rect(AxCoor[b], AyCoor[b],50,50);
  }
  for(int d=0; d<5; d++){
    AyCoor[d]+=Asp;
  }
}
//Creating of Avatars Jonathan
void Planet(){
  fill(0,255,100);
  ellipse(250,900,1000,1000);
}
void SpaceShip(){
  fill(255);
  rect(SxCoor,SyCoor,100,50);
  fill(255,0,0);
  rect(SxCoor+28,SyCoor+25,45,25);
}
//Words (Screens)- Jonathan
void intro(){
  fill(255,0,0);
  text("Welcome to Planet Escape!", 100,100);
  text("Left-Click mouse to start.", 100,150);
  text("Maneuver around asteroids to escape Earth!", 25, 200);
  text("Press W, A, S, or D to move.",100, 250);
  text("Use ship to flee Earth!", 100, 300);
  text("GOOD LUCK!!", 100, 350);
  SpaceShip();
  Planet();
}
//Andre
void End(){ //<>//
  if(SyCoor<0){
    Victory();
  }else{
    if (endGame==!true){
      print("test end");
      Loser();
    }
  }
}
//Jonathan
void Victory(){
  fill(0,255,0);
  text("You Win!", 220,200);
  text("Congrats!", 220,250);
}
//Joanthan
void Loser(){
  fill(255,0,0);
  text("You lose :<", 220,200);
  text("Left-click your mouse to try again!", 50, 250);
}
//Andre
void DD(){
  for(int f=0; f<5; f++){
    if((AxCoor[f]<=SxCoor|| AxCoor[f]>=SxCoor+100)||(AyCoor[f]<=SyCoor||AyCoor[f]>=SyCoor+50)){
     endGame=false;
    }
  }
}
