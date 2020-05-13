import processing.core.*;
import processing.sound.*;

public class PagePlay extends GUIplay
{
  private PApplet myApp;
  private Game myGame;
  private Engine engine;
  private Terminator terminator;
  private Congratulator congratulator;
  
  public PagePlay(PApplet theApp, Game theGame, Terminator theTerminator,Congratulator theCongratulator) {
    myApp = theApp;
    myGame = theGame;
    terminator = theTerminator;
    congratulator = theCongratulator;
    engine = Engine.start(theApp,theTerminator,congratulator);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
  }
  
  public void runGame() {
    engine.run();
    engine.statistics();
  }
  
  public void endGame() {
    myGame.addScore(engine.getScore());
    myGame.addShots(engine.getShots());
    myGame.addItems(engine.getItems());
    myGame.addPlayTime(engine.getPlayTime());
    //myApp.println("Score: " + engine.getScore());
    //myApp.println("Shots: " + engine.getShots());
    //myApp.println("Items: " + engine.getItems());
    //myApp.println("Play Time: " + engine.getPlayTime());
    
    engine.stop();
    myApp.delay(1000);
  }
  
  public void playKeyPressed() {
    if(engine!=null) {engine.checkKeyPressed();}
  }
  
  public void playKeyReleased() {
    if(engine!=null) {engine.checkKeyReleased();}
  }
  
}
