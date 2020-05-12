import processing.core.*;

public class Engine
{
  private PApplet myApp;
  private int radius;
  
  public Engine(PApplet theApp) {
    myApp = theApp;
    radius = 1;
  }
  
  public void run() {
    myApp.fill(255,255,255);
    myApp.circle(myApp.width/2,myApp.height/2,radius++);
    myApp.noFill();
  }
}
