import processing.sound.*;

Game myGame;

void setup()
{
  fullScreen();
  frameRate(30);
  smooth(3);
  loop();
  
  myGame = Game.startGame(this);
  myGame.setupGame(2,4);
}

void draw()
{
  background(0,0,0);
  myGame.runGame();
}

void keyPressed()
{
  myGame.checkKeyPressed();
  if(key=='1') {myGame.levelItUp(4,6);}
  if(key=='2') {myGame.levelItUp(6,8);}
}

void keyReleased()
{
  myGame.checkKeyReleased();
}
