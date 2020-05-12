Game theGame;
int counter;
String adminlogin = "admin";
String adminPW = "admin";
boolean checkadmin = false;
void setup()
{
  size(1200,800);
  //fullScreen();
  theGame = new Game(this);
  //counter = 0;
}

void draw()
{
  background(0,0,0);
  theGame.run();
}

//void keyPressed()
//{
//  if(keyCode == UP) {
//    switch(counter) {
//      case 0: theGame.change2Register(); counter ++; break;
//      case 1: theGame.change2Menu(); counter ++; break;
//      case 2: theGame.change2Play(); counter ++; break;
//      case 3: theGame.change2Gameover(); counter ++; break;
//      case 4: theGame.change2Statistics(); counter ++; break;
//      case 5: theGame.change2Login(); counter=0; break;
//    }
//  }
//}

void controlEvent(ControlEvent theEvent) {
 
 if(theEvent.isController()) { 
 
 switch(theEvent.getController().getId()) {
    case(1):
    theGame.change2Menu();break;
    case(2):
    theGame.change2Register();break;
    case(3):
    theGame.change2Gameover();break;
    case(4):
    theGame.change2Login();break;
    case(5):
    theGame.change2Play();break;
    case(6):
    theGame.change2Statistics();break;
    case(7):
    theGame.change2Login();break;
    case(8):
    theGame.change2Login();break;
    case(9):
    theGame.change2Login();break;
    case(10):
    String loginname = theEvent.getController().getStringValue();
    println("login: " + loginname);
    if (loginname.equals(adminlogin)){
      checkadmin = true;
    }
    break;
    case(11):
    String passwort = theEvent.getController().getStringValue();
    println("passwort: " + passwort);
    if (passwort.equals(adminPW) && (checkadmin == true)){
      println("admin login erfolgreich!!");
    }
    break; 
    
    //case(2):
    //Button3.hide();
    //Button1.show();
    //break;
    //case(3):
    //Button1.hide();
    //Button2.show();
    //AsteroidsText.show();
    //break;
    //case(4):
    //String textinput = theEvent.getController().getStringValue();
    //println(textinput);
    //break;
 } 
}
}
