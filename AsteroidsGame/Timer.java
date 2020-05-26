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
    int hr = (int)(wholeTime/3600);
    
    wholeTime = wholeTime - (3600*hr);
    int min = (int)(wholeTime/60);
    
    wholeTime = wholeTime - (60*min);
    int sec = wholeTime%60;
    
    String result = myApp.nf(hr,2) + ":" + myApp.nf(min,2) + ":" + myApp.nf(sec,2);
    
    return result;
  }
  
}
