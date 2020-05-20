Game theGame;
DBProxy dbprox;
MySQL dbconnection;
void setup()
{
  dbconnection = new MySQL( this, "localhost", "asteroidsV1", "DBHandler", "1234" );
   if(dbconnection.connect())
   {
      if (args != null && args.length==2) {
       // data = new Data(dbconnection,args[0],args[1]);///neu
       dbprox = new DBProxy(dbconnection,args[0],args[1]);
      } else {
        println("args == null");
        //data = new Data(dbconnection);///neu
        dbprox = new DBProxy(dbconnection);
      }
  }
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
      theGame.change2Login();
      dbprox.logout();
      break;
      case(2):
      theGame.change2Register();break;
      case(3):
      if(dbprox.login("testPlayer3","1234")==1)
      {
        theGame.change2Menu();
        println("Login erfolgt!");
      }
      break;
      case(4):
      theGame.change2Statistics();break;
      case(5):
      theGame.change2Play();
      dbprox.gameStartUpdateStats();
      break;
      case(6):
      theGame.change2Gameover();
      dbprox.gameEndUpdateStats(theGame.getScore(),theGame.getShots(),theGame.getItems(),theGame.getHighscore());
      break;
      case(999):
      theGame.previousPage(); break;
      case(10):
      String username = theEvent.getController().getStringValue();       
      break;
      case(11):
      String password = theEvent.getController().getStringValue();
      break; 
   }
 }
}
