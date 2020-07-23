import processing.core.*;
import java.lang.*;

public class Game
{
  private String email;
  private String username;
  private String password;
  private int highscore;
  private int score;
  private int hits;
  private int shots;
  private int items;
  private String time_played;
  private String total_time_played;
  private GUI gui;
  private Terminator terminator;
  private Congratulator congratulator;
  private PApplet myApp;
  private DBProxy dbprox;
  private MySQL dbconnection;
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  **/
  public Game (PApplet theApp) {

    myApp = theApp;
    gui = new PageLogin(myApp,this);
    terminator = new Terminator();
    congratulator = new Congratulator();
    highscore=0;
    score=0;
    hits = 0;
    shots=0;
    items=0;
    time_played="00:00:00";
    total_time_played = "0.0.0 | 0:0:0";
    email = "";
    username = "";
    password = "";
    
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
  
  /**
  * This method starts the game, draws the objects and detects when the game is won or lost.
  **/
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
  
  /**
  * This method closes the application when the exit button is clicked.
  **/
  public void end() {
    myApp.exit();
  }
  
  /**
  * ! NOT USED !
  * This method runs the method "runHint" on another thread.
  * It was written for test purposes.
  *
  * @param str !NOT USED! holds the string to be print.
  **/
  public void showHint(String str) {
    myApp.thread("runHint");
  }
  
  /**
  * This method handles events when pressing a key and is called in the processing main file (due to way of working of processing).
  * This method uses the method "checkKeyPressed" from the gui.
  **/
  public void checkKeyPressed() {
    gui.checkKeyPressed();
  }
  
  /**
  * This method handles events when releasing a key and is called in the processing main file (due to way of working of processing).
  * This method uses the method "checkKeyReleased" from the gui.
  **/
  public void checkKeyReleased() {
    gui.checkKeyReleased();
  }
  
  /**
  * This method is used for the back button.
  * It changes the gui to the previous page.
  **/
  public void previousPage() {
    String currentGame = gui.getClass().getName();
    if(currentGame=="AsteroidsGame$PageRegister") {change2Login();}
    else if(currentGame=="AsteroidsGame$PageMenu") {change2Login();}
    else if(currentGame=="AsteroidsGame$PageStatistics") {change2Menu();}
    else if(currentGame=="AsteroidsGame$PageGameover") {change2Menu();}
    else if(currentGame=="AsteroidsGame$PageGameWon") {change2Menu();}
  }
  
  /**
  * This is a getter method.
  *
  * @returns the times asteroids were hit by a laser shot during the game.
  **/
  public int getHits() {return hits;}
  
  /**
  * This is a setter method.
  *
  * @param hts holds the new number of hits to be set.
  **/
  public void setHits(int hts) {hits = hts;}
  
  /**
  * This is a getter method.
  *
  * @returns the highscore of the game.
  **/
  public int getHighscore() {return highscore;}
  
  /**
  * This is a setter method.
  *
  * @param hs holds the new highscore to be set. If the new value is greater than the old one then it will be set otherwise not.
  **/
  public void addHighscore(int hs) {
    if(hs>highscore) {highscore=hs;}
  }
  
  /**
  * This is a getter method.
  *
  * @returns the score made during the game.
  **/
  public int getScore() {return score;}
  
  /**
  * This is a setter method.
  *
  * @param sc holds the new value for score to be set.
  **/
  public void addScore(int sc) {score = sc;}
  
  /**
  * This is a getter method.
  *
  * @returns the times a laser shot was fired during the game.
  **/
  public int getShots() {return shots;}
  
  /**
  * This is a setter method.
  *
  * @param sc holds the new value for shots to be set.
  **/
  public void addShots(int sh) {shots = sh;}
  
  /**
  * This is a getter method.
  *
  * @returns the items collected during the game.
  **/
  public int getItems() {return items;}
  
  /**
  * This is a setter method.
  *
  * @param it holds the new value of number of items to be set after collecting new ones.
  **/
  public void addItems(int it) {items = it;}
  
  /**
  * This is a getter method to get the played time in the game session.
  *
  * @returns the played time after a game session.
  **/
  public String getPlayTime() {return time_played;}
  
  /**
  * This is a setter method to set the played time in the game session.
  *
  * @param pt holds the played time after a game session. It will be retrieved from the data base.
  **/
  public void addPlayTime(String pt) {
    // Structure is mm:ss and you have to stick to it
    time_played = pt;
    //int numberAddMinutes = Integer.parseInt(str(pt.charAt(0)) + str(pt.charAt(1)));
    //int numberAddSeconds = Integer.parseInt(str(pt.charAt(3)) + str(pt.charAt(4)));
    //int numberCrtMinutes = Integer.parseInt(str(time_played.charAt(0)) + str(time_played.charAt(1)));
    //int numberCrtSeconds = Integer.parseInt(str(time_played.charAt(3)) + str(time_played.charAt(4)));
    
    //numberCrtMinutes += numberAddMinutes;
    //numberCrtSeconds += numberAddSeconds;
    
    //time_played = myApp.nf(numberCrtMinutes,2) + ":" + myApp.nf(numberCrtSeconds,2);
  }
  
  /**
  * This is a getter method.
  *
  * @returns the times asteroids were hit by a laser shot during the game.
  **/
  public String getTotalPlayTime() {return total_time_played;}
  
  /**
  * This is a setter method.
  *
  * @param str holds the total played time. It will be retrieved from the data base.
  **/
  public void setTotalPlayTime(String str) {total_time_played = str;}
  
  /**
  * This method updates the statistics in the data base after ending a game.
  **/
  public void updateEndStats() {
    dbprox.gameEndUpdateStats(hits,shots,items,score);
  }
  
  /**
  * This method is used to log in to the data base.
  *
  * @returns bool value: true if the login was successful / false if the login failed.
  **/
  public boolean logIn() {
    if(dbprox.login(username,password)==1)
      {
        //println("Login erfolgt!");
        score=0;
        hits = 0;
        shots=0;
        items=0;
        time_played="00:00:00";
        return true;
      }
      else return false;
  }
  
  /**
  * This method is used to log out of the data base.
  *
  * @returns bool value: true if the logout was successful / false if the logout failed.
  **/
  public boolean logOut() {
      dbprox.logout();
      email = "";
      username = "";
      password = "";
      score=0;
      hits = 0;
      shots=0;
      items=0;
      time_played="00:00:00";
      
      return true;
  }
  
  /**
  * This method is used to sign up in the data base.
  *
  * @returns bool value: true if the signup was successful / false if the signup failed.
  **/
  public boolean signUp() {
    if(dbprox.register(email,username,password)==0) {
      //dbprox.login(username,password);
      return true;
    }
    else return false;
  }
  
  /**
  * This is a setter method to save the typed email address in a member-variable.
  *
  * @param str holds the typed email address.
  **/
  public void setEmail (String str) {email = str; myApp.println(str);}
  
  /**
  * This is a setter method to save the typed username in a member-variable.
  *
  * @param str holds the typed username.
  **/
  public void setUsername (String str) {username = str; myApp.println(str);}
  
  /**
  * This is a setter method to save the typed password in a member-variable.
  *
  * @param str holds the typed password.
  **/
  public void setPassword (String str) {password = str; myApp.println(str);}
  
  /**
  * This is a getter method.
  *
  * @returns the email address saved in the member-variable.
  **/
  public String getEmail() {return email;}
  
  /**
  * This is a getter method.
  *
  * @returns the username saved in the member-variable.
  **/
  public String getUsername() {return username;}
  
  /**
  * This is a getter method.
  *
  * @returns the password saved in the member-variable.
  **/
  public String getPassword() {return password;}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to login page.
  **/
  public void change2Login () {gui.end(); gui = new PageLogin(myApp,this);}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to register page.
  **/
  public void change2Register () {gui.end(); gui = new PageRegister(myApp,this);}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to menu page.
  **/
  public void change2Menu () { gui.end(); gui = new PageMenu(myApp,this);}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to play page.
  **/
  public void change2Play () {gui.end();dbprox.gameStartUpdateStats(); gui = new PagePlay(myApp,this,terminator,congratulator);}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to game over page.
  **/
  public void change2Gameover () {gui.end(); gui = new PageGameover(myApp,this);}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to game won page.
  **/
  public void change2Gamewon () {gui.end(); gui = new PageGameWon(myApp,this);}
  
  /**
  * This method deletes the layout and the current components of te gui and changes to statistics page.
  **/
  public void change2Statistics () {
    
    if(dbprox.getStats(this)) {
      this.addHighscore(dbprox.getHighscore());
      //this.setTotalPlayTime("Hi");
      total_time_played = dbprox.getTotalPlayedTime();
      println(dbprox.getTotalPlayedTime());
    } 
    gui.end();
    gui = new PageStatistics(myApp,this);}
}
