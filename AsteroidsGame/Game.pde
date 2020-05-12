import processing.core.*;
import java.lang.*;

public class Game
{
  public int highscore;
  public int score;
  public int shots;
  public int items;
  public String time_played;
  private GUI gui;
  private Terminator terminator;
  private PApplet myApp;
  
  public Game (PApplet theApp) {

    myApp = theApp;
    gui = new PageLogin(myApp,this);
    terminator = new Terminator();
    //engine = new Engine(theApp,this);

  }
  
  public void run() {
    gui.show();
    if (terminator.isGameTerminated()==true) {
      change2Gameover();
      terminator.restartGame();
    }
  }
  
  public void end() {
    myApp.exit();
  }
  
  public void checkKeyPressed() {
    gui.checkKeyPressed();
  }
  
  public void checkKeyReleased() {
    gui.checkKeyReleased();
  }
  
  public void previousPage() {
    String currentGame = gui.getClass().getName();
    if(currentGame=="AsteroidsGame$PageRegister") {change2Login();}
    else if(currentGame=="AsteroidsGame$PageMenu") {change2Login();}
    else if(currentGame=="AsteroidsGame$PageStatistics") {change2Menu();}
    else if(currentGame=="AsteroidsGame$PageGameover") {change2Menu();}
  }
  
  public void change2Login () {gui.end(); gui = new PageLogin(myApp,this);}
  public void change2Register () {gui.end(); gui = new PageRegister(myApp,this);}
  public void change2Menu () {gui.end(); gui = new PageMenu(myApp,this);}
  public void change2Play () {gui.end(); gui = new PagePlay(myApp,this,terminator);}
  public void change2Gameover () {gui.end(); gui = new PageGameover(myApp,this);}
  public void change2Statistics () {gui.end(); gui = new PageStatistics(myApp,this);}
}
