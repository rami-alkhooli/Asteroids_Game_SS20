import processing.core.*;

public class Timer
{
  private int startTime;
  private int stopTime;

  private static PApplet myApp;
  
  /**
  * This constructor.
  *
  * @param theApp is an object to access and use processing functions in the current application.
  **/
  public Timer(PApplet theApp) {
    myApp = theApp;
    startTime = myApp.millis();
    stopTime = myApp.millis();
  }
  
  /**
  * This method starts the timer.
  **/
  public void run() {
    stopTime = myApp.millis();
  }
  
  /**
  * This method stops the timer.
  **/
  public void stop() {
    startTime = myApp.millis();
    stopTime = myApp.millis();
  }
  
  /**
  * This is a getter method.
  *
  * @returns a string tha holds the recorded time in the form hh:mm:ss
  **/
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
