Game theGame;

void setup()
{
  size(1200,800);
  //fullScreen();
  theGame = new Game(this);
}

void draw()
{
  background(0,0,0);
  theGame.run();
}

void keyPressed()
{
  theGame.checkKeyPressed();
}

void keyReleased()
{
  theGame.checkKeyReleased();
}

void controlEvent(ControlEvent theEvent) {
 
 if(theEvent.isController()) { 
 
 switch(theEvent.getController().getId()) {
    case(0):
    theGame.end(); break;
    case(1):
    theGame.change2Login();break;
    case(2):
    theGame.change2Register();break;
    case(3):
    theGame.change2Menu();break;
    case(4):
    theGame.change2Statistics();break;
    case(5):
    theGame.change2Play();break;
    case(6):
    theGame.change2Gameover();break;
    case(999):
    theGame.previousPage(); break;
 } 
}
}
