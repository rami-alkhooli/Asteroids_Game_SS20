Game theGame;

void setup()
{
  size(1200,800);
  frameRate(60);
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
      theGame.logOut(); theGame.change2Login(); break;
      
      case(2):
      theGame.change2Register();break;
      
      case(3):
      if(theGame.logIn()) {theGame.change2Menu();}
      
      break;
      case(4):
      theGame.change2Statistics();break;
      
      case(5):
      theGame.change2Play();

      break;
      case(6):
      if(theGame.signUp()) {theGame.change2Menu();} break;
      
      case(999):
      theGame.previousPage(); break;
      
      case(10):
      theGame.setUsername(theEvent.getController().getStringValue()); break;    
      
      case(11):
      theGame.setPassword(theEvent.getController().getStringValue()); break; 
      
      case(12):
      theGame.setUsername(theEvent.getController().getStringValue()); break; 
      
      case(13):
      theGame.setEmail(theEvent.getController().getStringValue()); break; 
      
      case(14):
      theGame.setPassword(theEvent.getController().getStringValue()); break; 
      
   }
 }
}
