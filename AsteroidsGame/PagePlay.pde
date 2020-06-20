import processing.core.*;
import processing.sound.*;

public class PagePlay extends GUIplay
{
  private PApplet myApp;
  private Game myGame;
  private Engine engine;
  private Terminator terminator;
  private Congratulator congratulator;
  
  /**
  * The constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  * @param theGame is an object to access the components of the game adn exchange data.
  * @param theTerminator is an object used to determine whether the game is lost.
  * @param theCongratulator is an object used to determine whether the game is won.
  **/
  public PagePlay(PApplet theApp, Game theGame, Terminator theTerminator,Congratulator theCongratulator) {
    myApp = theApp;
    myGame = theGame;
    terminator = theTerminator;
    congratulator = theCongratulator;
    engine = Engine.start(theApp,theTerminator,congratulator);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
  }
  
  /**
  * This method starts the game engine and displays the game statistics on top of the screen.
  **/
  public void runGame() {
    engine.run();
    engine.statistics();
  }
  
  /**
  * This method stops the game engine, stops the game and saves the statistics made in the game in the member-variables.
  **/
  public void endGame() {
    myGame.addHighscore(engine.getScore());
    myGame.setHits(engine.getHits());
    myGame.addScore(engine.getScore());
    myGame.addShots(engine.getShots());
    myGame.addItems(engine.getItems());
    myGame.addPlayTime(engine.getPlayTime());
    myGame.updateEndStats();
    
    engine.stop();
    myApp.delay(1000);
  }
  
  /**
  * This method handles events when keys are pressed during the game.
  **/
  public void playKeyPressed() {
    if(engine!=null) {engine.checkKeyPressed();}
  }
  
  /**
  * This method handles events when keys are released during the game.
  **/
  public void playKeyReleased() {
    if(engine!=null) {engine.checkKeyReleased();}
  }
  
}
