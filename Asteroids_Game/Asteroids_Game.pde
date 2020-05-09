import processing.sound.*;

Game myGame;

void setup()
{
  fullScreen();
  frameRate(60);
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
}

void keyReleased()
{
  myGame.checkKeyReleased();
}
