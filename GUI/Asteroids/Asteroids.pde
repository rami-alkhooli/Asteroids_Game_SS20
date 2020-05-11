Game theGame;
int counter;
void setup()
{
  size(1200,800);
  //fullScreen();
  theGame = new Game(this);
  counter = 0;
}

void draw()
{
  background(0,0,0);
  theGame.run();
}

void keyPressed()
{
  if(keyCode == UP) {
    switch(counter) {
      case 0: theGame.change2Register(); counter ++; break;
      case 1: theGame.change2Menu(); counter ++; break;
      case 2: theGame.change2Play(); counter ++; break;
      case 3: theGame.change2Gameover(); counter ++; break;
      case 4: theGame.change2Statistics(); counter ++; break;
      case 5: theGame.change2Login(); counter=0; break;
    }
  }
}
