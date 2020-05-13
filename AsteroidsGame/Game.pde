import processing.core.*;
import java.lang.*;

public class Game
{
  private int highscore;
  private int score;
  private int shots;
  private int items;
  private String time_played;
  private GUI gui;
  private Terminator terminator;
  private Congratulator congratulator;
  private PApplet myApp;
  
  public Game (PApplet theApp) {

    myApp = theApp;
    gui = new PageLogin(myApp,this);
    terminator = new Terminator();
    congratulator = new Congratulator();
    highscore=0;
    score=0;
    shots=0;
    items=0;
    time_played="00:00";

  }
  
  public void run() {
    gui.show();
    
    if (terminator.isGameTerminated()==true) {
      change2Gameover();
      terminator.restartGame();
      congratulator.restartGame();
    }
    else if (congratulator.isGameWon()==true) {
      change2Gamewon();
      terminator.restartGame();
      congratulator.restartGame();
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
    else if(currentGame=="AsteroidsGame$PageGameWon") {change2Menu();}
  }
  
  public int getHighscore() {return highscore;}
  public void addHighscore(int hs) {
    if(hs>highscore) {highscore=hs;}
  }
  
  public int getScore() {return score;}
  public void addScore(int sc) {score += sc;}
  
  public int getShots() {return shots;}
  public void addShots(int sh) {shots += sh;}
  
  public int getItems() {return items;}
  public void addItems(int it) {items += it;}
  
  public String getPlayTime() {return time_played;}
  public void addPlayTime(String pt) {
    // Structure is mm:ss
    String stringMinutes = str(pt.charAt(0)) + str(pt.charAt(1));
    String stringSeconds = str(pt.charAt(3)) + str(pt.charAt(4));
    int numberMinutes = Integer.parseInt(stringMinutes);
    int numberSeconds = Integer.parseInt(stringSeconds);
    time_played = stringMinutes + ":" + stringSeconds;
    //myApp.println("Added Time: " + stringMinutes + " Minutes and " + stringSeconds + " Seconds");
  }
  
  public void change2Login () {gui.end(); gui = new PageLogin(myApp,this);}
  public void change2Register () {gui.end(); gui = new PageRegister(myApp,this);}
  public void change2Menu () {gui.end(); gui = new PageMenu(myApp,this);}
  public void change2Play () {gui.end(); gui = new PagePlay(myApp,this,terminator,congratulator);}
  public void change2Gameover () {gui.end(); gui = new PageGameover(myApp,this);}
  public void change2Gamewon () {gui.end(); gui = new PageGameWon(myApp,this);}
  public void change2Statistics () {gui.end(); gui = new PageStatistics(myApp,this);}
}
