import processing.core.*;

public class Timer
{
  private int startTime;
  private int stopTime;

  private static PApplet myApp;
  
  public Timer(PApplet theApp) {
    myApp = theApp;
    startTime = myApp.millis();
    stopTime = myApp.millis();
  }
  
  public void run() {
    stopTime = myApp.millis();
  }
  
  public void stop() {
    startTime = myApp.millis();
    stopTime = myApp.millis();
  }
  
  public String getTime() {
    int wholeTime = (stopTime - startTime)/1000;
    String result = myApp.nf((int)((wholeTime/60)%60),2) + ":" + myApp.nf(wholeTime%60,2);
    return result;
  }
  
}
