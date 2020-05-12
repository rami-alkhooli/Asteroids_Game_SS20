import processing.core.*;
import processing.sound.*;

public class PagePlay extends GUIplay
{
  private PApplet myApp;
  private Game myGame;
  private Engine engine;
  private SoundFile bg;
  private Terminator terminator;
  
  public PagePlay(PApplet theApp, Game theGame, Terminator theTerminator) {
    myApp = theApp;
    myGame = theGame;
    terminator = theTerminator;
    engine = Engine.start(theApp,theTerminator);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
    //bg = new SoundFile(theApp,"background.mp3");
    //bg.loop();
  }
  
  public void runGame() {
    engine.run();
    engine.statistics();
  }
  
  public void endGame() {
    engine = null;
    terminator.terminateGame();
    myApp.delay(1000);
    //bg.stop();
  }
  
  public void playKeyPressed() {
    if(engine!=null) {engine.checkKeyPressed();}
  }
  
  public void playKeyReleased() {
    if(engine!=null) {engine.checkKeyReleased();}
  }
  
}
