import processing.sound.*;

Game myGame;

void setup()
{
  fullScreen();
  myGame = Game.startGame(this);
  myGame.setupGame(3,5);
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
