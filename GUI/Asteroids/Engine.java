import processing.core.*;

public class Engine
{
  private int myID;
  private static PApplet myApp;
  
  public Engine(PApplet theApp) {
    myApp = theApp;
  }
  
  public void startEngine() {
    myApp.text("Engine has just started",myApp.width/2,myApp.height/2);
  }
  
}
