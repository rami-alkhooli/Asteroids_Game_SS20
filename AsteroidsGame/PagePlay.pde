import processing.core.*;

public class PagePlay extends GUIplay
{
  private PApplet myApp;
  private Game myGame;
  private Engine engine;
  
  public PagePlay(PApplet theApp, Game theGame) {
    myApp = theApp;
    myGame = theGame;
    engine = new Engine(theApp);
    //engine = new Engine(theApp,myGame);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
  }
  
  public void runGame() {
    engine.run();
  }
  
  public void endGame() {
    engine = null;
  }
  
  public void playKeyPressed() {
    if(key=='s') {endGame(); myGame.change2Gameover();}
    if(key=='r') {engine = new Engine(myApp); myGame.change2Play();}
  }
  
  public void playKeyReleased() {
    //if(key=='a') {myApp.println("a was just released");}
  }
  
}
