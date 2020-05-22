import processing.core.*;
import java.lang.*;

public class Game
{
  private String username;
  private String password;
  private int highscore;
  private int score;
  private int shots;
  private int items;
  private String time_played;
  private GUI gui;
  private Terminator terminator;
  private Congratulator congratulator;
  private PApplet myApp;
  private DBProxy dbprox;
  private MySQL dbconnection;
  
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
    username = "testPlayer2";
    password = "1234";
    
    dbconnection = new MySQL(theApp, "192.168.43.14", "asteroidsV1", "DBHandler", "1234" );
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
  public void addScore(int sc) {score = sc;}
  
  public int getShots() {return shots;}
  public void addShots(int sh) {shots += sh;}
  
  public int getItems() {return items;}
  public void addItems(int it) {items += it;}
  
  public String getPlayTime() {return time_played;}
  public void addPlayTime(String pt) {
    // Structure is mm:ss and you have to stick to it
    int numberAddMinutes = Integer.parseInt(str(pt.charAt(0)) + str(pt.charAt(1)));
    int numberAddSeconds = Integer.parseInt(str(pt.charAt(3)) + str(pt.charAt(4)));
    int numberCrtMinutes = Integer.parseInt(str(time_played.charAt(0)) + str(time_played.charAt(1)));
    int numberCrtSeconds = Integer.parseInt(str(time_played.charAt(3)) + str(time_played.charAt(4)));
    
    numberCrtMinutes += numberAddMinutes;
    numberCrtSeconds += numberAddSeconds;
    
    time_played = myApp.nf(numberCrtMinutes,2) + ":" + myApp.nf(numberCrtSeconds,2);
  }
  
  public void updateEndStats() {
    dbprox.gameEndUpdateStats(score,shots,items,highscore);
  }
  
  public boolean logIn() {
    if(dbprox.login(username,password)==1)
      {
        //println("Login erfolgt!");
        return true;
      }
      else return false;
  }
  public void change2Login () {gui.end(); dbprox.logout(); gui = new PageLogin(myApp,this);}
  public void change2Register () {gui.end(); gui = new PageRegister(myApp,this);}
  public void change2Menu () { gui.end(); gui = new PageMenu(myApp,this);}
  public void change2Play () {gui.end();dbprox.gameStartUpdateStats(); gui = new PagePlay(myApp,this,terminator,congratulator);}
  public void change2Gameover () {gui.end(); gui = new PageGameover(myApp,this);}
  public void change2Gamewon () {gui.end(); gui = new PageGameWon(myApp,this);}
  public void change2Statistics () {gui.end();  gui = new PageStatistics(myApp,this);}
}
