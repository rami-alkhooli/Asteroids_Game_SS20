import processing.sound.*;

Game myGame;

void setup()
{
  fullScreen();
  //size(1000,1000);
  frameRate(60);
  smooth(3);
  loop();
  
  myGame = Game.startGame(this);
  myGame.setupGame();
  myGame.setupLevel(1);
}

void draw()
{
  background(0,0,0);
  myGame.runGame();
  myGame.statistics();
}

void keyPressed()
{
  myGame.checkKeyPressed();
}

void keyReleased()
{
  myGame.checkKeyReleased();
}
