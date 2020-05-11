import processing.core.*;

public class PagePlay extends GUIplay
{
  private PApplet myApp;
  private Engine engine;
  
  public PagePlay(PApplet theApp) {
    myApp = theApp;
    engine = new Engine(theApp);
    sWidth = theApp.width/8;
    sHeight = theApp.height/8;
  }
  
  public void runGame() {
    engine.startEngine();
  }
  
  public void endGame() {
    engine = null;
  }
}
